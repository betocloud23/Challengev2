module "app" {
  source = "./app2"

  prefix   = var.prefix
  location = var.location
  Owner    = var.Owner

  # Pasa otras variables si es necesariotesttt
}

# Definición de variables en el root module
variable "prefix" {
  description = "Prefix for resources"
  type        = string
}

variable "location" {
  description = "Azure location for resources"
  type        = string
}

variable "Owner" {
  description = "Owner of the resources"
  type        = string
}

# Pueden ser definidas más variables o configuraciones necesarias
