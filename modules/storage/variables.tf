variable "root_rg_name" {
  type        = string
  description = "The name of the resource group passed from the root configuration."
}

variable "root_location" {
  type        = string
  description = "The location of the resource group passed from the root configuration."
}

variable "admin_contact" {
  type        = string
  description = "Email address for budget notification."
}