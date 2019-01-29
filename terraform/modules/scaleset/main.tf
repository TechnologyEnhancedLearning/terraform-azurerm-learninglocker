module "os" {
  source       = "../os"
  vm_os_simple = "${var.vm_os_simple}"
}

data "template_file" "cloudconfig" {
  template = "${file("${var.cloudconfig_file}")}"
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloudconfig.rendered}"
  }
}

resource "azurerm_virtual_machine_scale_set" "vmss" {
  name                = "${var.vmss_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  automatic_os_upgrade = "${var.automatic_os_upgrade}"
  upgrade_policy_mode  = "${var.upgrade_policy_mode}"

  # rolling_upgrade_policy {
  #   max_batch_instance_percent              = "${var.max_batch_instance_percent}"
  #   max_unhealthy_instance_percent          = "${var.max_unhealthy_instance_percent}"
  #   max_unhealthy_upgraded_instance_percent = "${var.max_unhealthy_upgraded_instance_percent}"
  #   pause_time_between_batches              = "${var.pause_time_between_batches}"
  # }

  # Required when using rolling upgrade policy
  health_probe_id = "${var.health_probe_id}"
  sku {
    name     = "${var.vm_size}"
    tier     = "Standard"
    capacity = "${var.nb_instance}"
  }
  storage_profile_image_reference {
    id        = "${var.vm_os_id}"
    publisher = "${coalesce(var.vm_os_publisher, module.os.calculated_value_os_publisher)}"
    offer     = "${coalesce(var.vm_os_offer, module.os.calculated_value_os_offer)}"
    sku       = "${coalesce(var.vm_os_sku, module.os.calculated_value_os_sku)}"
    version   = "${var.vm_os_version}"
  }
  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "${var.managed_disk_type}"
  }
  storage_profile_data_disk {
    lun           = 0
    caching       = "ReadWrite"
    create_option = "Empty"
    disk_size_gb  = "${var.data_disk_size}"
  }
  os_profile {
    computer_name_prefix = "${var.computer_name_prefix}"
    admin_username       = "${var.admin_username}"
    admin_password       = "${var.admin_password}"
    custom_data          = "${data.template_cloudinit_config.config.rendered}"
  }
  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
      key_data = "${file("${var.ssh_key}")}"
    }
  }
  network_profile {
    name    = "${var.network_profile_name}"
    primary = true

    ip_configuration {
      name                                   = "${var.ip_configuration_name}"
      primary                                = true
      subnet_id                              = "${var.vnet_subnet_id}"
      load_balancer_backend_address_pool_ids = ["${var.load_balancer_backend_address_pool_ids}"]
    }
  }
  tags = "${var.tags}"
}
