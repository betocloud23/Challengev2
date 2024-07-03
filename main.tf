provider "azurerm" {
  features {}
}

module "tranzact_rg" {
  source   = "./tranzact_rg"
  prefix   = var.prefix
  location = var.location
  Owner    = var.Owner
}

module "vnetcidr" {
  source              = "./tranzact_vnet"
  for_each            = { for vnet in var.vnets : vnet.name => vnet }
  prefix              = var.prefix
  vnet_name           = each.value.name
  vnet_cidr           = each.value.cidr
  subnets             = each.value.subnets
  resource_group_name = module.tranzact_rg.name
  location            = module.tranzact_rg.location
  Owner               = var.Owner
}

module "subnets" {
  source               = "./tranzact_subnet"
  for_each             = { for vnet in var.vnets : vnet.name => vnet }
  resource_group_name  = module.tranzact_rg.name
  virtual_network_name = module.vnetcidr[each.key].app3main.name
  subnets              = each.value.subnets
}

module "tranzact_nsg" {
  source              = "./tranzact_nsg"
  prefix              = var.prefix
  resource_group_name = module.tranzact_rg.name
  location            = module.tranzact_rg.location
  Owner               = var.Owner
}

module "tranzact_subnet_nsg" {
  for_each                  = { for vnet, data in module.subnets : vnet => data }
  source                    = "./tranzact_subnet_nsg"
  subnet_id                 = each.value.app3internal.id
  network_security_group_id = module.tranzact_nsg.id
}

module "tranzact_keyvault" {
  source              = "./tranzact_keyvault"
  prefix              = var.prefix
  resource_group_name = module.tranzact_rg.name
  location            = module.tranzact_rg.location
  tenant_id           = var.tenant_id
  client_id           = var.client_id
  allowed_ip_address  = var.allowed_ip_address
  subnet_id           = module.subnets["vnet1"]["subnet"]["vnet1-private-subnet"].app3internal.id
  Owner               = var.Owner
}

module "tranzact_storage_account" {
  source                   = "./tranzact_storage_account"
  prefix                   = var.prefix
  resource_group_name      = module.tranzact_rg.name
  location                 = module.tranzact_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  allowed_ip_address       = var.allowed_ip_address
  subnet_id                = module.subnets["vnet1"]["subnet"]["vnet1-private-subnet"].app3internal.id
  Owner                    = var.Owner
}
