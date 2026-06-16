output "key_vault_id" {
  value       = azurerm_key_vault.kv.id
  description = "The resource ID of the Key Vault passed to the storage module."
}

output "encryption_key_name" {
  value       = azurerm_key_vault_key.storage_key.name
  description = "The name of the cryptographic key used for storage encryption."
}