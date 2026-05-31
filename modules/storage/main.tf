resource "azurerm_resource_group" "rg" {
  count    = var.create_rg ? 1 : 0
  name     = "rg-web-portfolio"
  location = "East US"
}

resource "random_string" "unique_id" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "storage" {
  count                    = var.create_storage ? 1 : 0
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