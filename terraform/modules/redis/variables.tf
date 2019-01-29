variable "redis_name" {
  description = "(Required) The name of the Redis instance. Changing this forces a new resource to be created."
}

variable "location" {
  description = "(Required) The location of the resource group."
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Redis instance."
}

variable "capacity" {
  description = "(Required) The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4."
}

variable "family" {
  description = "(Required) The SKU family to use. Valid values are C and P, where C = Basic/Standard, P = Premium."
  default     = "C"
}

variable "sku_name" {
  description = "(Required) The SKU of Redis to use - can be either Basic, Standard or Premium."
}

variable "enable_non_ssl_port" {
  description = "(Optional) Enable the non-SSL port (6789) - disabled by default."
  default     = "false"
}

variable "tags" {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
}
