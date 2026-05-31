output "cdn_name" {
  value       = try(azurerm_cdn_profile.cdn[*].name[0], null)
  description = "The name of the created CDN profile."
}

output "cdn_location" {
  value       = try(azurerm_cdn_profile.cdn[*].location[0], null)
  description = "The location of the created CDN profile."
}