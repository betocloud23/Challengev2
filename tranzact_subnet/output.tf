output "subnet_ids" {
  value = { for k, v in azurerm_subnet.app3internal : k => v.id }
}
