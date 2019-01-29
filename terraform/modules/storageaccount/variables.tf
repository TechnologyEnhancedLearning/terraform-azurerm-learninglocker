variable "account_replication_type" {
  description = "The type of replication used for this storage account."
}

variable "account_tier" {
  description = "The Tier of this storage account."
}

variable "location" {
  description = "The Azure location where the Storage Account exists"
}

variable "resource_group_name" {
  description = "(Required) Specifies the name of the resource group the Storage Account is located in."
}

variable "storage_account_name" {
  description = "(Required) Specifies the name of the Storage Account"
}

variable "tags" {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
}
