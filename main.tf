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
  #use_oidc = true
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-selfhosted-demo"
  location = "Central India"
}

