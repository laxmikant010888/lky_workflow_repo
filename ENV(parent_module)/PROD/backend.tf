terraform {
    backend "azurerm" {
        resource_group_name  = "prod-rg"
        storage_account_name = "prod-lkstg"
        container_name       = "prod-tfstate"
        key                  = "terraform.tfstate"
    }
}