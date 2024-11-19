
provider "azurerm" {
    subscription_id = var.subscription_id
    features {}
}

resource "azurerm_resource_group" "rg" {
    name     = var.resource_group_name
    location = var.location
}

module "app_service" {
  source = "./modules/app_service"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  app_service_plan_id = azurerm_app_service_plan.example.id
  app_name            = var.app_name
}

resource "azurerm_app_service_plan" "example" {
  name                = "test-asp-projet"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux" # ou "Windows" selon vos besoins
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

module "blob_storage" {
  source                = "./modules/storage"
  storage_account_name  = var.storage_account_name
  container_name        = var.container_name
  resource_group_name   = var.resource_group_name
  location              = var.location
}

module "postgresql" {
  source                  = "./modules/database"
  postgresql_server_name  = "example-postgresql-server"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  admin_username          = "adminuser"
  admin_password          = "SuperSecurePassword123"
  database_name           = "exampledb"
}

module "network" {
  source              = "./modules/network"
  vnet_name           = "my-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}



