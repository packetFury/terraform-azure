resource "azurerm_cdn_profile" "cdn" {
    name                = var.cdn_profile_name
    location            = var.location
    resource_group_name = var.resource_group_name
    sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
    name                = var.cdn_endpoint_name
    profile_name        = azure_cdn_profile.cdn.name
    location            = var.location
    resource_group_name = var.resource_group_name

    origin {
        name            = "${var.cdn_endpoint_name}-origin"
        host_name       = var.origin_host_name
    }
}