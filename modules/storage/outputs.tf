output "rg_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the created resource group."
}

output "rg_location" {
  value       = azurerm_resource_group.rg.location
  description = "The location of the created resource group."
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "The name of the created storage account."
}

output "primary_connection_string" {
  value       = azurerm_storage_account.storage.primary_connection_string
  sensitive   = true
  description = "The connection string of the created storage account."
}

output "static_web_host" {
  value       = azurerm_storage_account.storage.primary_web_host
  description = "The hostname of the static website endpoint for the CDN origin."
}