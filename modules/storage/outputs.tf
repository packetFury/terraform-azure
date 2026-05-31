output "rg_name" {
    value       = try(azurerm_resource_group.rg.name, null)
    description = "The name of the created resource group."
}

output "rg_location" {
    value       = try(azurerm_resource_group.rg.location, null)
    description = "The location of the created resource group."
}

output "storage_account_name" {
    value = try(azurerm_storage_account.storage[*].name[0], null)
    description = "The name of the created storage account."
}

output "primary_connection_string" {
    value = try(azurerm_storage_account.storage[*].primary_connection_string[0], null)
    sensitive = true
    description = "The connection string of the created storage account."
}