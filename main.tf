terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.63.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "MSK" {
  name     = "Mitra"
  location = "Eastus"
}

resource "azurerm_virtual_network" "MSK-vn" {
  name                = "MSK-Network"
  resource_group_name = azurerm_resource_group.MSK.name
  location            = azurerm_resource_group.MSK.location
  address_space       = ["10.0.0.0/16"]
}