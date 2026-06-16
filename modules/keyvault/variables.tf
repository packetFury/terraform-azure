variable "resource_group_name" {
  type        = string
  description = "The name of the target resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where the Key Vault will be deployed."
}
