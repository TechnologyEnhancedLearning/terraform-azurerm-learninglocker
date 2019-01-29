output "id" {
  description = "The resource group ID."
  value       = "${azurerm_resource_group.rg.id}"
}

output "name" {
  description = "The name of the resource group"
  value       = "${azurerm_resource_group.rg.name}"
}

output "location" {
  description = "The location assigned in the resource group"
  value       = "${azurerm_resource_group.rg.location}"
}
