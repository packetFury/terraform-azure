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
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
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