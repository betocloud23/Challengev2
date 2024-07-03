variable "resource_group_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "subnets" {
  type = list(object({
    name = string
    cidr = string
  }))
}
