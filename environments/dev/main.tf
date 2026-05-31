module "storage_dev" {
  source            = "../../modules/storage"
  root_rg_name      = var.root_rg_name
  root_location     = var.root_location
}

module "cdn_dev" {
  source              = "../../modules/network"
  resource_group_name = module.storage_dev.rg_name
  location            = module.storage_dev.rg_location
  origin_host_name    = module.storage_dev.static_web_host

  cdn_profile_name    = "cdn-profile-dev"
  cdn_endpoint_name   = "cdn-endpoint-dev"
}