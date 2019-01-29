output "servicebus_namespace" {
  value = "${azurerm_servicebus_namespace.namespace.name}"
}

output "queue_name" {
  value = "${azurerm_servicebus_queue.queue.name}"
}
