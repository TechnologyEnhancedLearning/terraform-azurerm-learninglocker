variable "bastion_name" {}

variable "location" {}

variable "ip_configuration_name" {}

variable "subnet_id" {}

variable "admin_username" {}

variable "admin_password" {}

variable "ssh_key" {}

variable "tags" {
  type = "map"
}

variable "resource_group_name" {}
