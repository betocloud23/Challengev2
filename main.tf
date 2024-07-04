module "tranzact_rg" {
  source   = "./tranzact_rg"
  prefix   = var.prefix
  location = var.location
  Owner    = var.Owner
}

module "tranzact_vnet" {
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

module "tranzact_subnet" {
  source               = "./tranzact_subnet"
  for_each             = { for vnet in var.vnets : vnet.name => vnet }
  resource_group_name  = module.tranzact_rg.name
  virtual_network_name = module.tranzact_vnet[each.key].name
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
  for_each                  = { for vnet, data in module.tranzact_subnet : vnet => data }
  source                    = "./tranzact_subnet_nsg"
  subnet_id                 = each.value.subnet_ids[each.key]
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
  subnet_id           = module.tranzact_subnet["vnet1"].subnet_ids["vnet1-private-subnet"]
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
  subnet_id                = module.tranzact_subnet["vnet1"].subnet_ids["vnet1-private-subnet"]
  Owner                    = var.Owner
}
