variable "location" {
  description = "Location of the environmnet"
  type = string
}

variable "networking_resource_group_name" {
  description = "Networking Resource Group name"
  type = string
}

variable "monitoring_test_resource_group_name" {
  description = "Monitoring Test Resource Group name"
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
    pip_enable = bool
    auto_shutdown_enable = bool
    auto_shutdown_time = string
    auto_shutdown_timezone = string
    source_image_publisher = string
    source_image_offer = string
    source_image_sku = string
    source_image_version = string
  }))
}

variable "lvm_size" {
  type = string
}

variable "lvm_admin_username" {
  type = string
}

variable "wvms" {
  description = "(Required) Map of Windows virtual machines"
  type = map(object({
    name = string
    subnet_id = number
    subnet_name = string
    nic = string
    pip_enable = bool
    auto_shutdown_enable = bool
    auto_shutdown_time = string
    auto_shutdown_timezone = string
    source_image_publisher = string
    source_image_offer = string
    source_image_sku = string
    source_image_version = string
  }))
}

variable "wvm_size" {
  type = string
}

variable "wvm_admin_username" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "nsg_subnets" {
  description = "Subnets to attach NSG"
  type = set(string)
}