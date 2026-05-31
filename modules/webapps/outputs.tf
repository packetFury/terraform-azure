/*output "cdn_name" {
  value       = azurerm_cdn_profile.cdn.name
  description = "The name of the created CDN profile."
}

output "cdn_location" {
  value       = azurerm_cdn_profile.cdn.location
  description = "The location of the created CDN profile."
}*/

output "swa_name" {
  value       = azurerm_static_web_app.swa.name
  description = "The name of the created Static Web App"
}