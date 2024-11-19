# Providers 
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Resources

resource "azurerm_resource_group" "groupe-de-ressource" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_app_service_plan" "junia-app-service" {
  name                = var.app_name
  location            = var.location
  resource_group_name = azurerm_resource_group.groupe-de-ressource.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

# Module

module "app_service" {
  source = "./modules/app_service"

  resource_group_name = azurerm_resource_group.groupe-de-ressource.name
  location            = var.location
  app_service_plan_id = azurerm_app_service_plan.junia-app-service.id
  app_name            = var.app_name
}

module "blob_storage" {
  source                = "./modules/storage"
  storage_account_name  = var.storage_account_name
  container_name        = var.container_name
  resource_group_name   = var.resource_group_name
  location              = var.location
}

module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

/*module "postgresql" {
  source                  = "./modules/database"
  postgresql_server_name  = "example-postgresql-server"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  admin_username          = "adminuser"
  admin_password          = "SuperSecurePassword123"
  database_name           = "exampledb"
}*/


