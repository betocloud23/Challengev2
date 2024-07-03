# .tfvars principal actualizado

location                 = "East US 2"
prefix                   = "tranzact2" # Actualizado para coincidir con el módulo
Owner                    = "Alberto C."
account_tier             = "Standard"
account_replication_type = "LRS"
allowed_ip_address       = "170.246.58.126"
#subnet_cidr              = ["10.12.1.0/24"]
#tenant_id = "0f981bed-3ce5-4102-ba02-9bdae75f938b"
#client_id = "21c85634-3226-4f39-b42e-1005c9afbff4"
# terraform.tfvars
vnets = [
  {
    name = "vnet1"
    cidr = ["10.12.0.0/16"]
    subnets = [
      {
        name = "vnet1-public-subnet"
        cidr = "10.12.1.0/24"
      },
      {
        name = "vnet1-private-subnet"
        cidr = "10.12.2.0/24"
      }
    ]
  },
  {
    name = "vnet2"
    cidr = ["10.13.0.0/16"]
    subnets = [
      {
        name = "vnet2-public-subnet"
        cidr = "10.13.1.0/24"
      },
      {
        name = "vnet2-private-subnet"
        cidr = "10.13.2.0/24"
      }
    ]
  }
]
