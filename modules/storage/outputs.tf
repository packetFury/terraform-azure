output "storage_account_name" {
    value = try(azurerm_storage_account.storage[*].name[0], null)
}

output "primary_connection_string" {
    value = try(azurerm_storage_account.storage[*].primary_connection_string[0], null)
    sensitive = true
}