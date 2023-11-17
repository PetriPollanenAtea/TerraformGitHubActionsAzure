variable "subscription_id" {
  description = "Subscription ID"
  type = string
}

variable "tenant_id" {
  description = "Tenant ID"
  type = string
}

variable "location" {
  description = "Location of the environmnet"
  type = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type = string
}

variable "vnet_name" {
  description = "Virtual Network"
  type = string
}

variable "vnet_address_space" {
  description = "Virtual Network address space"
  type = list(string)
}

variable "subnets" {
  description = "(Required) Map of subnet names and address prefixes."
}

variable "lvms" {
  description = "(Required) Map of Linux virtual machines"
  type = map(object({
    name = string
    subnet_id = number
    subnet_name = string
    nic = string
  }))
}

variable "lvm_size" {
  type = string
}

variable "lvm_admin_username" {
  type = string
}