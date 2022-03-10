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
  name     = var.dev_var
  location = "Central India"
}
resource "azurerm_resource_group" "rg_aquib_qa" {
  name     = var.qa_var
  location = "Central India"
}
resource "azurerm_app_service_plan" "dev_plan_appservice" {
  name                = "dev_plan_appservice"
  location            = azurerm_resource_group.rg_aquib_dev.location
  resource_group_name = azurerm_resource_group.rg_aquib_dev.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service_plan" "qa_plan_appservice" {
  name                = "qa_plan_appservice"
  location            = azurerm_resource_group.rg_aquib_qa.location
  resource_group_name = azurerm_resource_group.rg_aquib_qa.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "dev-aquib-appservice" {
  name                = "dev-aquib-appservice"
  location            = azurerm_resource_group.rg_aquib_dev.location
  resource_group_name = azurerm_resource_group.rg_aquib_dev.name
  app_service_plan_id = azurerm_app_service_plan.dev_plan_appservice.id

}
resource "azurerm_app_service" "qa-aquib-appservice" {
  name                = "qa-aquib-appservicee"
  location            = azurerm_resource_group.rg_aquib_qa.location
  resource_group_name = azurerm_resource_group.rg_aquib_qa.name
  app_service_plan_id = azurerm_app_service_plan.qa_plan_appservice.id

}
resource "azurerm_storage_account" "aquibdevstorageaccount" {
  name                     = "aquibdevstorageaccount"
  resource_group_name      = azurerm_resource_group.rg_aquib_dev.name
  location                 = azurerm_resource_group.rg_aquib_dev.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
resource "azurerm_storage_account" "aquibqastorageaccount" {
  name                     = "aquibqastorageaccount"
  resource_group_name      = azurerm_resource_group.rg_aquib_qa.name
  location                 = azurerm_resource_group.rg_aquib_qa.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
