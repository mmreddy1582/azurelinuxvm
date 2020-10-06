terraform {
    backend "azurerm" {
        resource_group_name  = "TFstate-rg"
        storage_account_name = "remotestateformstorage"
        container_name       = "mura-tfstate"
        key                  = "testproject.tfstate"
    }
}
