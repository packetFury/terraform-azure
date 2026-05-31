variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure region for the resources."
}

variable "cdn_profile_name" {
  type        = string
  description = "The name of the Classic CDN profile."
}

variable "cdn_endpoint_name" {
  type        = string
  description = "The name of the Classic CDN endpoint."cd 
}

variable "origin_host_name" {
  type        = string
  description = "The fully qualified domain name of the backend origin."
}

variable "create_cdn" {
  type        = bool
  description = "Toggle creation on/off for Feature Flag Infrastructure."
}