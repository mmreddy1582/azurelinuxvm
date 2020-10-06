data "azurerm_subnet" "example" {
  name                 = "websubnet"
  virtual_network_name = "vmss-vnet"
  resource_group_name  = "murapoc-rg"
}

data "azurerm_image" "redhat" {
  name                = "ubunutimage-image-20200930115340"
  resource_group_name = "murapoc-images-rg"

}