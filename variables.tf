# Provider

# variable subscription_id {}
# variable tenant_id {}
# variable client_id {}
# variable client_secret {}

# Resource Group

variable "resource_group_name" {
  type        = "string"
  description = "(Required) The name of the resource group. Must be unique on your Azure subscription."
}

variable "location" {
  type        = "string"
  description = "(Required) The location where the resource group should be created. For a list of all Azure locations."
}

variable "tags" {
  description = "The tags to associate with your infrastructure."
  type        = "map"

  default = {
    BillingIdentifier = "TEL"
  }
}

# Network Security Group

variable "security_group_name" {
  description = "Network security group name"
}

variable "predefined_rules" {
  type    = "list"
  default = []
}

variable "custom_rules" {
  description = "Security rules for the network security group using this format name = [priority, direction, access, protocol, source_port_range, destination_port_range, source_address_prefix, destination_address_prefix, description]"
  type        = "list"
  default     = []
}

# Application Insights

variable "app_insights_name" {
  description = "(Required) Specifies the name of the Application Insights component. Changing this forces a new resource to be created."
}

variable "application_type" {
  description = "(Required) Specifies the type of Application Insights to create. Valid values are Java, iOS, MobileCenter, Other, Phone, Store, Web and Node.JS."
}

# Load Balancer

variable "prefix" {
  description = "(Required) Default prefix to use with your resource names."
  default     = "azure_lb"
}

variable "lb_port" {
  description = "Protocols to be used for lb health probes and rules. [frontend_port, protocol, backend_port]"
  type        = "map"

  default = {
    http = [
      "80",
      "Tcp",
      "80",
    ]
  }
}

variable "lb_type" {
  type        = "string"
  description = "(Optional) Defined if the loadbalancer is private or public"
  default     = "public"
}

variable "frontend_name" {
  description = "(Required) Specifies the name of the frontend ip configuration."
}

variable "remote_port" {
  description = "Protocols to be used for remote vm access. [protocol, backend_port].  Frontend port will be automatically generated starting at 50000 and in the output."
  type        = "map"

  default = {
    ssh = [
      "Tcp",
      "22",
    ]
  }
}

# Network

variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = "vnet"
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/24"
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  default     = ["10.0.1.0/24"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  default     = ["subnet1", "subnet2", "subnet3"]
}

# Compute

variable "nb_public_ip" {
  description = "Number of public IPs to assign corresponding to one IP per vm. Set to 0 to not assign any public IP addresses."
  default     = "0"
}

variable "nb_instances" {
  description = "Specify the number of vm instances"
  default     = "4"
}

variable "vm_os_simple" {
  description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS and SLES to get the latest image version of the specified os.  Do not provide this value if a custom value is used for vm_os_publisher, vm_os_offer, and vm_os_sku."
  default     = "UbuntuServer"
}

variable "data_disk" {
  type        = "string"
  description = "Set to true to add a datadisk."
  default     = "false"
}

variable "data_sa_type" {
  description = "Data Disk Storage Account type"
  default     = "Standard_LRS"
}

variable "data_disk_size_gb" {
  description = "Storage data disk size size"
  default     = ""
}

variable "boot_diagnostics" {
  description = "(Optional) Enable or Disable boot diagnostics"
  default     = "false"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_DS1_V2"
}

variable "admin_username" {
  description = "The admin username of the VM that will be deployed"
  default     = "azureuser"
}

variable "custom_data" {
  description = "The custom data to supply to the machine. This can be used as a cloud-init for Linux systems."
  default     = ""
}

variable "admin_password" {
  description = "The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure"
  default     = ""
}

variable "ssh_key" {
  description = "Path to the public key to be used for ssh access to the VM.  Only used with non-Windows vms and can be left as-is even if using Windows vms. If specifying a path to a certification on a Windows machine to provision a linux vm use the / in the path versus backslash. e.g. c:/home/id_rsa.pub"
  default     = "~/.ssh/id_rsa.pub"
}

variable "delete_os_disk_on_termination" {
  description = "Delete datadisk when machine is terminated"
  default     = "false"
}

variable "vm_hostname" {
  description = "local name of the VM"
  default     = "hostname"
}

# Redis

variable "redis_name" {
  description = "(Required) The name of the Redis instance. Changing this forces a new resource to be created."
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

# Service Bus

variable "servicebus_namespace" {
  description = "(Required) Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created."
}

variable "sku" {
  description = "(Required) Defines which tier to use. Options are basic, standard or premium."
}

variable "servicebus_queue" {
  description = " (Required) Specifies the name of the ServiceBus Queue resource. Changing this forces a new resource to be created."
}

variable "enable_partitioning" {
  description = "(Optional) Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers. Changing this forces a new resource to be created. Defaults to false for Basic and Standard. For Premium, it MUST be set to true."
}

# Storage Account

variable "account_replication_type" {
  description = "The type of replication used for this storage account."
}

variable "account_tier" {
  description = "The Tier of this storage account."
}

variable "storage_account_name" {
  description = "(Required) Specifies the name of the Storage Account"
}

# Bastion

variable "bastion_name" {
  description = "Name of the prefix for the bastion name"
}

variable "bastion_ip_configuration_name" {
  description = "(Required) An ip_configuration block as documented below."
}
