module "storage_dev" {
    source                      = "../modules/storage"
    create_storage              = false
}

module "cdn_dev" {
    source                      = ".../modules/network"
    create_cdn                  = false
}