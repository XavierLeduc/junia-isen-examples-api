# Providers
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

# Network Module
module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
}

# App Service Module
module "app_service" {
  source              = "./modules/app_service"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  app_name            = var.app_name
  app_service_plan_name = var.app_service_plan_name
}



# Storage Module
module "blob_storage" {
  source              = "./modules/storage"
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
  resource_group_name  = azurerm_resource_group.resource_group.name
  location             = var.location
}

# Database Module
module "database" {
  source                  = "./modules/database"
  resource_group_name     = azurerm_resource_group.resource_group.name
  location                = var.location
  postgresql_server_name  = var.postgresql_server_name
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  database_name           = var.database_name
  subnet_id               = module.network.database_subnet_id
}
