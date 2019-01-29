variable "location" {
  default = "uksouth"
}

resource "random_id" "rg_name" {
  byte_length = 8
}

module "network" {
  source              = "../../"
  resource_group_name = "${random_id.rg_name.hex}"
  location            = "${var.location}"
  address_space       = "10.0.0.0/16"
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}

module "loadbalancer" {
  source              = "../../../terraform/modules/loadbalancer"
  resource_group_name = "${random_id.rg_name.hex}"
  location            = "${var.location}"
  prefix              = "${random_id.rg_name.hex}"

  "remote_port" {
    ssh = ["Tcp", "22"]
  }

  "lb_port" {
    http = ["80", "Tcp", "80"]
  }
}

module "network" {
  source              = "Azure/network/azurerm"
  location            = "${var.location}"
  resource_group_name = "${random_id.rg_name.hex}"
}

output "public_ip" {
  value = "${module.mylb.azurerm_public_ip_address}"
}
