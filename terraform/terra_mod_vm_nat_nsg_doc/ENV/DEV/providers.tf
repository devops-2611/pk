terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.59.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "e5cb9ec6-5677-4ceb-81de-c20081fb79a9"
  # Configuration options
}