module "tranzact_rg" {
  source = "./tranzact_rg"
}

module "tranzact_vnet" {
  source              = "./tranzact_vnet"
  resource_group_name = module.tranzact_rg.name
  location            = module.tranzact_rg.location
}

module "tranzact_subnet" {
  source               = "./tranzact_subnet"
  resource_group_name  = module.tranzact_rg.name
  virtual_network_name = module.tranzact_vnet.name
}

module "tranzact_nic" {
  source              = "./tranzact_nic"
  resource_group_name = module.tranzact_rg.name
  location            = module.tranzact_rg.location
  subnet_id           = module.tranzact_subnet.id
}

module "tranzact_nsg" {
  source              = "./tranzact_nsg"
  resource_group_name = module.tranzact_rg.name
  location            = module.tranzact_rg.location
}

module "tranzact_subnet_nsg" {
  source                    = "./tranzact_subnet_nsg"
  subnet_id                 = module.tranzact_subnet.id
  network_security_group_id = module.tranzact_nsg.id
}

module "tranzact_keyvault" {
  source              = "./tranzact_keyvault"
  resource_group_name = module.tranzact_rg.name
  location            = module.tranzact_rg.location
  subnet_id           = module.tranzact_subnet.id
}

module "tranzact_storage_account" {
  source              = "./tranzact_storage_account"
  resource_group_name = module.tranzact_rg.name
  location            = module.tranzact_rg.location
  subnet_id           = module.tranzact_subnet.id
}
