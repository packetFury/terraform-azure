resource "azurerm_resource_group" "rg" {
  name     = var.root_rg_name
  location = var.root_location
}

resource "random_string" "unique_id" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "storage" {
  name                     = "stor${random_string.unique_id.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "ZRS" #Pass CKV_AZURE_206

  public_network_access_enabled = false #Pass CKV_AZURE_59
  allow_nested_items_to_be_public = false #Pass CKV_AZURE_190
  min_tls_version = "TLS1_2" #Pass CKV_AZURE_44

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
  }
}

resource "azurerm_role_assignment" "storage_kv_access" {
  scope                   = var.key_vault_id
  role_definition_name    = "Key Vault Crypto Service Encryption User"
  principal_id            = azurerm_storage_account.storage.identity[0].principal_id
}

resource "azurerm_storage_account_customer_managed_key" "cmk" {
  storage_account_id      = azurerm_storage_account.storage.id
  key_vault_id            = var.key_vault_id
  key_name                = var.encryption_key_name
  
  depends_on              = [azurerm_role_assignment.storage_kv_access]
}

resource "azurerm_consumption_budget_resource_group" "safety_cap" {
  name                    = "overbudget-hard-stop"
  resource_group_id       = azurerm_resource_group.rg.id
  amount                  = 30
  time_grain              = "Monthly"

  time_period {
    start_date            = "2026-06-01T00:00:00Z"
  }

  notification {
    enabled               = true
    threshold             = 100.0
    operator              = "EqualTo"
    contact_emails        = [var.admin_contact]
  }
}