terraform {
  required_version = "~> 0.11"

  required_providers {
    azurerm  = "~> 1.20.0"
    template = "~> 1.0"
  }
}

/* Resource Group */

module "resourcegroup" {
  source = "./terraform/modules/resourcegroup"

  name     = "${var.resource_group_name}"
  location = "${var.location}"

  tags = "${merge(var.tags, map("resourceType", "resourcegroup"))}"
}

/* Virtual Network */

module "network" {
  source = "Azure/network/azurerm"

  vnet_name           = "${var.vnet_name}"
  location            = "${module.resourcegroup.location}"
  resource_group_name = "${module.resourcegroup.name}"

  address_space   = "${var.address_space}"
  subnet_prefixes = ["${var.subnet_prefixes}"]
  subnet_names    = ["${var.subnet_names}"]

  tags = "${merge(var.tags, map("resourceType", "network"))}"
}

/* Network Security Group */

module "networksecuritygroup" {
  source = "Azure/network-security-group/azurerm"

  resource_group_name = "${module.resourcegroup.name}"
  location            = "${module.resourcegroup.location}"
  security_group_name = "${var.security_group_name}"

  # predefined_rules = ["${var.predefined_rules}"]
  # custom_rules = [
  #   "${var.custom_rules}",
  # ]

  tags = "${merge(var.tags, map("resourceType", "nsg"))}"
}

/* Subnet connection to Security Group */

resource "azurerm_subnet" "subnet" {
  name                      = "${var.subnet_names[2]}"
  address_prefix            = "${var.subnet_prefixes[2]}"
  resource_group_name       = "${module.resourcegroup.name}"
  virtual_network_name      = "${module.network.vnet_name}"
  network_security_group_id = "${module.networksecuritygroup.network_security_group_id}"
}

/* Application Insights */

module "appinsights" {
  source = "./terraform/modules/appinsights"

  app_insights_name   = "${var.app_insights_name}"
  location            = "${module.resourcegroup.location}"
  resource_group_name = "${module.resourcegroup.name}"
  application_type    = "${var.application_type}"

  tags = "${merge(var.tags, map("resourceType", "app_insights"))}"
}

/* Loadbalancer */

module "loadbalancer" {
  source = "Azure/loadbalancer/azurerm"

  resource_group_name = "${module.resourcegroup.name}"
  location            = "${module.resourcegroup.location}"
  type                = "${var.lb_type}"
  prefix              = "${var.prefix}"
  remote_port         = "${var.remote_port}"
  lb_port             = "${var.lb_port}"
  frontend_name       = "${var.frontend_name}"

  tags = "${merge(var.tags, map("resourceType", "loadbalancer"))}"
}

/* Compute */

module "compute" {
  source                        = "./terraform/modules/compute"
  resource_group_name           = "${module.resourcegroup.name}"
  location                      = "${module.resourcegroup.location}"
  admin_username                = "${var.admin_username}"
  admin_password                = "${var.admin_password}"
  ssh_key                       = "${var.ssh_key}"
  vm_hostname                   = "${var.vm_hostname}"
  vm_size                       = "${var.vm_size}"
  nb_public_ip                  = "${var.nb_public_ip}"
  nb_instances                  = "${var.nb_instances}"
  vm_os_simple                  = "${var.vm_os_simple}"
  vnet_subnet_id                = "${module.network.vnet_subnets[2]}"
  boot_diagnostics              = "${var.boot_diagnostics}"
  delete_os_disk_on_termination = "${var.delete_os_disk_on_termination}"

  data_disk         = "${var.data_disk}"
  data_disk_size_gb = "${var.data_disk_size_gb}"
  data_sa_type      = "${var.data_sa_type}"

  tags = "${merge(var.tags, map("resourceType", "compute"))}"
}

/* Redis */

module "redis" {
  source = "./terraform/modules/redis"

  redis_name          = "${var.redis_name}"
  resource_group_name = "${module.resourcegroup.name}"
  location            = "${module.resourcegroup.location}"
  capacity            = "${var.capacity}"
  family              = "${var.family}"
  sku_name            = "${var.sku_name}"

  tags = "${merge(var.tags, map("resourceType", "redis"))}"
}

/* Service Bus */

module "servicebus" {
  source = "./terraform/modules/servicebus"

  servicebus_namespace = "${var.servicebus_namespace}"
  location             = "${module.resourcegroup.location}"
  resource_group_name  = "${module.resourcegroup.name}"
  sku                  = "${var.sku}"
  servicebus_queue     = "${var.servicebus_queue}"
  enable_partitioning  = "${var.enable_partitioning}"

  tags = "${merge(var.tags, map("resourceType", "servicebus"))}"
}

/* Storage Account */

module "storage_account" {
  source                   = "./terraform/modules/storageaccount"
  storage_account_name     = "${var.storage_account_name}"
  resource_group_name      = "${module.resourcegroup.name}"
  location                 = "${module.resourcegroup.location}"
  account_tier             = "${var.account_tier}"
  account_replication_type = "${var.account_replication_type}"

  tags = "${merge(var.tags, map("resourceType", "storage_account"))}"
}

/* Bastion Host */

module "bastion" {
  source = "./terraform/modules/bastion"

  bastion_name          = "${var.bastion_name}"
  location              = "${module.resourcegroup.location}"
  resource_group_name   = "${module.resourcegroup.name}"
  ip_configuration_name = "${var.bastion_ip_configuration_name}"
  subnet_id             = "${module.network.vnet_subnets[2]}"
  admin_username        = "${var.admin_username}"
  admin_password        = "${var.admin_password}"
  ssh_key               = "${var.ssh_key}"

  tags = "${merge(var.tags, map("resourceType", "bastion"))}"
}
