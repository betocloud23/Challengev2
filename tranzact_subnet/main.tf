resource "azurerm_subnet" "app3internal" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [each.value.cidr]

  service_endpoints = [
    "Microsoft.Storage",
    "Microsoft.KeyVault",
  ]
}
