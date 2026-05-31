output "cdn_name" {
  value       = azurerm_cdn_profile.cdn.name
  description = "The name of the created CDN profile."
}

output "cdn_location" {
  value       = azurerm_cdn_profile.cdn.location
  description = "The location of the created CDN profile."
}