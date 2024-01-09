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

lvms = {
  lvm1 = {
    name = "lvm1"
    subnet_id = 0
    subnet_name = "web1"
    nic = "lvm1"
    pip_enable = true
    auto_shutdown_enable = true
    auto_shutdown_time = "1700"
    auto_shutdown_timezone = "FLE Standard Time"
    source_image_publisher = "Canonical"
    source_image_offer = "UbuntuServer"
    source_image_sku = "18.04-LTS"
    source_image_version = "latest"
  }
  lvm2 = {
    name = "lvm2"
    subnet_id = 0
    subnet_name = "web1"
    nic = "lvm2"
    pip_enable = false
    auto_shutdown_enable = false
    auto_shutdown_time = "1700"
    auto_shutdown_timezone = "FLE Standard Time"
    source_image_publisher = "Canonical"
    source_image_offer = "0001-com-ubuntu-server-jammy"
    source_image_sku = "22_04-lts-gen2"
    source_image_version = "latest"
  }
}

wvm_size = "Standard_B2ms"
wvm_admin_username = "optimusprime"

wvms = {
  wvm1 = {
    name = "wvm1"
    subnet_id = 0
    subnet_name = "web1"
    nic = "wvm1"
    pip_enable = true
    auto_shutdown_enable = true
    auto_shutdown_time = "1700"
    auto_shutdown_timezone = "FLE Standard Time"
    source_image_publisher = "MicrosoftWindowsServer"
    source_image_offer = "WindowsServer"
    source_image_sku = "2022-Datacenter"
    source_image_version = "latest"
  }
}

nsg_name = "nsg-default"
nsg_subnets = [ 
  "web1",
  "web2" 
]

nsg_rules = {
  inbound_allow_rdp = {
    name                       = "inbound_allow_RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "83.146.176.121/32"
    destination_address_prefix = "*"
  }
  inbound_allow_ssh = {
    name                       = "inbound_allow_SSH"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "83.146.176.121/32"
    destination_address_prefix = "*"
  }
  inbound_block_all = {
    name                       = "inbound_block_all"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  outbound_block_all = {
    name                       = "outbound_block_all"
    priority                   = 4096
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

