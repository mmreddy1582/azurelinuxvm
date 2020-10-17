provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "example" {
  name     = "murapoc-rg2"
  location = "Southeast Asia"
}

module "linuxservers" {
  source                        = "./terraform-azurerm-compute"
  resource_group_name           = azurerm_resource_group.example.name
  vm_hostname                   = "sgazmuraappvm"
  nb_public_ip                  = 1
  remote_port                   = "22"
  nb_instances                  = 1
  vm_os_id                      = data.azurerm_image.redhat.id
  vm_os_publisher               = "Canonical"
  vm_os_offer                   = "UbuntuServer"
  vm_os_sku                     = "18.04-LTS"
  vnet_subnet_id                = data.azurerm_subnet.example.id
  boot_diagnostics              = true
  private_ip_allocation_method  = "Static"
  delete_os_disk_on_termination = true
  nb_data_disk                  = 1
  data_disk_size_gb             = 64
  data_sa_type                  = "Premium_LRS"
  enable_ssh_key                = true
  vm_size                       = "Standard_D2s_v3"
  vm_ipaddress                  = "10.1.0.6"
  
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  enable_accelerated_networking = false
}

output "linux_vm_private_ips" {
  value = module.linuxservers.network_interface_private_ip
}

output "linux_vm_public_ip" {
  value = module.linuxservers.public_ip_address
}

