variable "root_rg_name" {
    type        = string
    description = "The name of the root resource group."
}

variable "root_location" {
    type        = string
    description = "The location of the root resource group."
}

variable "admin_contact" {
  type        = string
  description = "Email address for budget notification."
}