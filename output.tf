output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.tranzact.name
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.main.name
}

output "subnet_id" {
  description = "The ID of the internal subnet"
  value       = azurerm_subnet.internal.id
}

output "nic_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.main.id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}

output "key_vault_name" {
  description = "The name of the Key Vault"
  value       = azurerm_key_vault.vault.name
}

output "key_vault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.vault.vault_uri
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.stga.name
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the storage account"
  value       = azurerm_storage_account.stga.primary_access_key
  sensitive   = true
}
