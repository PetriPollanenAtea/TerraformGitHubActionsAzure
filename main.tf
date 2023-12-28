resource "azurerm_resource_group" "rg_networking_we" {
  location = var.location
  name = var.networking_resource_group_name
}

resource "azurerm_resource_group" "rg_monitoring_test" {
  location = var.location
  name = var.monitoring_test_resource_group_name
}

module "network" {
  source = "github.com/PetriPollanenAtea/modules/network"
  depends_on = [ azurerm_resource_group.rg_networking_we ]

  location            = var.location
  resource_group_name = var.networking_resource_group_name
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  subnets             = var.subnets
}

module "lvm" {
  source = "github.com/PetriPollanenAtea/modules/linuxvm"
  depends_on = [module.network.virtual_network_id]

  location            = var.location
  resource_group_name = var.monitoring_test_resource_group_name
  vnet_id             = module.network.virtual_network_id
  lvms                = var.lvms
  lvm_size            = var.lvm_size
  lvm_admin_username  = var.lvm_admin_username
  nic_subnets         = module.network.subnet_ids
}