data "azurerm_subnet" "example" {
  name                 = "websubnet"
  virtual_network_name = "vmss-vnet"
  resource_group_name  = "murapoc-rg"
}

data "azurerm_image" "redhat" {
  name                = "ubuntu-image-20201005230601"
  resource_group_name = "murapoc-images-rg"

}
