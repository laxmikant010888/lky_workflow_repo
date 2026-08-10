terraform {
    backend "azurerm" {
        resource_group_name  = "dev-rg"
        storage_account_name = "dev-lkstg"
        container_name       = "dev-tfstate"
        key                  = "terraform.tfstate"
    }
}