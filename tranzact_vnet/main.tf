resource "azurerm_virtual_network" "app3main" {
  name                = "${var.prefix}-${var.vnet_name}"
  address_space       = var.vnet_cidr
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = {
    Owner = var.Owner
  }
}
