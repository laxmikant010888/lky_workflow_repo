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

  subscription_id = "fbb258e2-cd4d-4bd2-9c7d-a04b5cf93aaa"
}