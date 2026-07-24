terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}

provider "azurerm" {
  features {}
subscription_id = "a859689a-347e-41e4-8e6b-b4c1f510c9b6"
  
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-github-oidc-demo"
  location = "Central India"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
