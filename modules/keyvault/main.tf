data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
    name                        = "pf-cmk-kv"
    resource_group_name         = var.resource_group_name
    location                    = var.location
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    sku_name                    = "standard"

    soft_delete_retention_days  = 7
    purge_protection_enabled    = true
}

resource "azurerm_key_vault_key" "storage_key" {
    name                        = "pf-storage-encryption-key"
    key_vault_id                = azurerm_key_vault.kv.id
    key_type                    = "RSA"
    key_size                    = 2048

    key_opts = [
        "decrypt",
        "encrypt",
        "unwrapKey",
        "wrapKey"
    ]
}