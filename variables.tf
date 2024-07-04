variable "vnets" {
  description = "List of virtual networks and their subnets"
  type = list(object({
    name = string
    cidr = list(string)
    subnets = list(object({
      name = string
      cidr = string
    }))
  }))
}

variable "prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "Owner" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "allowed_ip_address" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "Owner" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "allowed_ip_address" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}
