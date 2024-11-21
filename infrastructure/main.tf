# Providers
# Ce bloc configure le fournisseur Azure et active les fonctionnalités nécessaires.
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Resource Group
# Création du groupe de ressources principal dans lequel toutes les ressources Azure seront regroupées.
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

# Network Module
# Module pour configurer le réseau, incluant le VNet et les sous-réseaux associés.
module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name # Nom du réseau virtuel.
  address_space       = var.address_space
  resource_group_name = azurerm_resource_group.resource_group.name # Plage d'adresses du VNet.
  location            = var.location
}

# App Service Module
# Module pour déployer un service applicatif Azure (App Service).
module "app_service" {
  source                = "./modules/app_service"
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
  app_name              = var.app_name
  app_service_plan_name = var.app_service_plan_name
  app_subnet_id         = var.app_subnet_id
  app_service_id        = var.app_service_id
}

# Storage Module
# Module pour configurer un compte de stockage et un conteneur blob.
module "blob_storage" {
  source                = "./modules/storage"
  storage_account_name  = var.storage_account_name
  container_name        = var.container_name
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
  blob_subnet_id        = var.blob_subnet_id
  storage_account_id    = var.storage_account_id
}

# Database Module
# Module pour configurer un serveur PostgreSQL Flexible et une base de données.
module "database" {
  source                  = "./modules/database"
  resource_group_name     = azurerm_resource_group.resource_group.name
  location                = var.location
  postgresql_server_name  = var.postgresql_server_name
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  database_name           = var.database_name
  subnet_id               = module.network.database_subnet_id # ID du sous-réseau pour PostgreSQL.
  vnet_id                 = module.network.vnet_id # ID du réseau virtuel.
  db_subnet_id            = var.db_subnet_id
  postgresql_server_id    = var.postgresql_server_id
}
