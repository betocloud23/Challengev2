# ./tranzact_vnet/variables.tf
variable "resource_group_name" {
  type = string
}

variable "prefix" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_cidr" {
  type = list(string)
}

variable "location" {
  type = string
}

variable "subnets" {
  type = list(object({
    name = string
    cidr = string
  }))
}

variable "Owner" {
  type = string
}
