variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region for the resources."
}

variable "cosmos_account_name" {
  type        = string
  description = "The Cosmos Account Name for the resources."
}