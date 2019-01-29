resource "azurerm_redis_cache" "redis" {
  name                = "${var.redis_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  capacity            = "${var.capacity}"
  family              = "${var.family}"
  sku_name            = "${var.sku_name}"
  enable_non_ssl_port = "${var.enable_non_ssl_port}"

  redis_configuration {}

  tags = "${var.tags}"
}
