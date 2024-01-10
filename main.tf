resource "azurerm_resource_group" "rg_networking_we" {
  location = var.location
  name = var.networking_resource_group_name
}

resource "azurerm_resource_group" "rg_loganalytics_we" {
  location = var.location
  name = var.loganalytics_resource_group_name
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


module "nsg" {
  source = "github.com/PetriPollanenAtea/modules/nsg/v1.0.0"
  depends_on = [module.network.virtual_network_id]

  location                = var.location
  resource_group_name     = var.monitoring_test_resource_group_name
  nsg_name                = var.nsg_name
  vnet_id                 = module.network.virtual_network_id
  nsg_rules               = var.nsg_rules
  nsg_subnets             = var.nsg_subnets
}

module "lvm" {
  source = "github.com/PetriPollanenAtea/modules/linuxvm/v1.2.0"
  depends_on = [module.network.virtual_network_id]

  location                = var.location
  resource_group_name     = var.monitoring_test_resource_group_name
  vnet_id                 = module.network.virtual_network_id
  lvms                    = var.lvms
  lvm_size                = var.lvm_size
  lvm_admin_username      = var.lvm_admin_username
  nic_subnets             = module.network.subnet_ids
}

/*
module "wvm" {
  source = "github.com/PetriPollanenAtea/modules/windowsvm/v1.2.0"
  depends_on = [module.network.virtual_network_id]

  location                = var.location
  resource_group_name     = var.monitoring_test_resource_group_name
  vnet_id                 = module.network.virtual_network_id
  wvms                    = var.wvms
  wvm_size                = var.wvm_size
  wvm_admin_username      = var.wvm_admin_username
  nic_subnets             = module.network.subnet_ids
}
*/

module "loganalytics" {
  source = "github.com/PetriPollanenAtea/modules/loganalytics/v1.0.0"
  depends_on = [ azurerm_resource_group.rg_loganalytics_we ]

  location = var.location
  resource_group_name = var.loganalytics_resource_group_name
  name = var.loganalytics_name
  sku = var.loganalytics_sku
  retention = var.loganalytics_retention
}