terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg_aquib_dev" {
  name     = "rg_aquib_dev"
  location = "Central India"
}
resource "azurerm_resource_group" "rg_aquib_qa" {
  name     = "rg_aquib_qa"
  location = "Central India"
}
