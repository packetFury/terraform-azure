/*
=====================================================
Legacy code written before I realized Azure CDN had 
been deprecated.
=====================================================
resource "azurerm_cdn_profile" "cdn" {
  name                = var.cdn_profile_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                = var.cdn_endpoint_name
  profile_name        = azurerm_cdn_profile.cdn.name
  location            = var.location
  resource_group_name = var.resource_group_name

  origin {
    name      = "${var.cdn_endpoint_name}-origin"
    host_name = var.origin_host_name
  }
}*/

resource "azurerm_static_web_app" "swa" {
  name                = var.swa_name
  resource_group_name = var.resource_group_name
  location            = "East US 2"
  sku_tier            = "Free"
  sku_size            = "Free"

  app_settings        = var.app_settings
}