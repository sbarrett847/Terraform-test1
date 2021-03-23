# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.52.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "rgtest1" {
  name     = "TerraForm-Test1-RG"
  location = "North Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnettest1" {
  name                = "TerraForm-Test1-vNet"
  resource_group_name = azurerm_resource_group.rgtest1.name
  location            = azurerm_resource_group.rgtest1.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnettest1" {
  name                 = "Terraform-Test1-subnet"
  resource_group_name  = azurerm_resource_group.rgtest1.name
  virtual_network_name = azurerm_virtual_network.vnettest1.name
  address_prefixes     = ["10.0.1.0/24"]
}