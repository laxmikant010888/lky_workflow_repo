terraform {
  required_version = ">= 1.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  use_oidc = true
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-github-oidc-demo"
  location = "Central India"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
