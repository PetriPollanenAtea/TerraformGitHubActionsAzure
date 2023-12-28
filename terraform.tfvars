location = "westeurope"
networking_resource_group_name = "rg-networking"
monitoring_test_resource_group_name = "rg-monitoring-test"

vnet_name = "vnet_hub_we"
vnet_address_space = [ "10.1.0.0/16" ]
subnets = {
  web1 = "10.1.1.0/24"
  web2 = "10.1.2.0/24"
  web3 = "10.1.3.0/24"
}

lvm_size = "Standard_B1s"
lvm_admin_username = "optimusprime"
lvm_source_image_publisher = "Canonical"
lvm_source_image_offer = "UbuntuServer"
lvm_source_image_sku = "18.04-LTS"
lvm_source_image_version = "latest"

lvms = {
  lvm1 = {
    name = "lvm1"
    subnet_id = 0
    subnet_name = "web1"
    nic = "lvm1"
  }
  lvm2 = {
    name = "lvm2"
    subnet_id = 0
    subnet_name = "web1"
    nic = "lvm2"
  }
}