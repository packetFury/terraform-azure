module "storage_dev" {
  source            = "../../modules/storage"
  root_rg_name      = var.root_rg_name
  root_location     = var.root_location

  admin_contact     = var.admin_contact
}

module "database_dev" {
  source              = "../../modules/database"
  resource_group_name = module.storage_dev.rg_name
  location            = module.storage_dev.rg_location
  cosmos_account_name = "portfolio-db-dev-unique"
}

module "swa_dev" {
  source              = "../../modules/webapps"
  swa_name            = var.swa_name
  resource_group_name = module.storage_dev.rg_name
  location            = module.storage_dev.rg_location
  origin_host_name    = module.storage_dev.static_web_host
}

import {
  to = module.storage_dev.azurerm_resource_group.rg
  id = "/subscriptions/4c6f7b0e-44e6-4543-81be-8ea94433b108/resourceGroups/rg-web-portfolio"
}