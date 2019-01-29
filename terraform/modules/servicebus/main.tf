resource "azurerm_servicebus_namespace" "namespace" {
  name                = "${var.servicebus_namespace}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "${var.sku}"

  tags = "${var.tags}"
}

resource "azurerm_servicebus_queue" "queue" {
  name                = "${var.servicebus_queue}"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.namespace.name}"

  enable_partitioning = "${var.enable_partitioning}"
}
