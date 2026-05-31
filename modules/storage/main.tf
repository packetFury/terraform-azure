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
  resource_group_name      = one(azurerm_resource_group.rg[*].name)
  location                 = one(azurerm_resource_group.rg[*].location)
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}