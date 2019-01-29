# General

variable "resource_group_name" {
  type        = "string"
  description = "(Required) The name of the resource group. Must be unique on your Azure subscription."
}

variable "location" {
  type        = "string"
  description = "(Required) The location where the resource group should be created. For a list of all Azure locations."
}

variable "tags" {
  type = "map"
}

# Namespace

variable "servicebus_namespace" {
  description = "(Required) The name of the ServiceBus Namespace to create this topic in. Changing this forces a new resource to be created."
}

variable "sku" {}

variable "enable_partitioning" {
  default = "true"
}

# Queue

variable "servicebus_queue" {}
