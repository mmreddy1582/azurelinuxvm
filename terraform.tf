terraform {
    backend "azurerm" {
        resource_group_name  = "murapoc-remotestate-rg"
        storage_account_name = "terraformremotestorage"
        container_name       = "vmdevstate"
        key                  = "testproject.tfstate"
    }
}