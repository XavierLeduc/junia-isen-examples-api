# Génération d'un ID aléatoire pour les noms uniques
resource "random_id" "unique_suffix" {
  byte_length = 4
}

# Providers
# Ce bloc configure le fournisseur Azure et active les fonctionnalités nécessaires.
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Resource Group
# Création du groupe de ressources principal dans lequel toutes les ressources Azure seront regroupées.
# Utilisation des noms dynamiques avec un suffixe aléatoire
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group_name}-${random_id.unique_suffix.hex}"
  location = var.location
}

# Network Module
# Module pour configurer le réseau, incluant le VNet et les sous-réseaux associés.
module "network" {
  source              = "./modules/network"
  vnet_name           = "${var.vnet_name}-${random_id.unique_suffix.hex}"
  address_space       = var.address_space
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
}

# App Service Module
# Module pour déployer un service applicatif Azure (App Service).
module "app_service" {
  source                = "./modules/app_service"
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
  app_name              = "${var.app_name}-${random_id.unique_suffix.hex}"
  app_service_plan_name = "${var.app_service_plan_name}-${random_id.unique_suffix.hex}"
  docker_image          = var.docker_image
}

# Storage Module
# Module pour configurer un compte de stockage et un conteneur blob.
module "blob_storage" {
  source                = "./modules/storage"
  storage_account_name  = substr("${var.storage_account_name}${random_id.unique_suffix.hex}", 0, 24) # Limite à 24 caractères
  container_name        = "${var.container_name}-${random_id.unique_suffix.hex}"
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
}

# Database Module
# Module pour configurer un serveur PostgreSQL Flexible et une base de données.
module "database" {
  source                  = "./modules/database"
  resource_group_name     = azurerm_resource_group.resource_group.name
  location                = var.location
  postgresql_server_name  = "${var.postgresql_server_name}-${random_id.unique_suffix.hex}"
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  database_name           = "${var.database_name}-${random_id.unique_suffix.hex}"
  subnet_id               = module.network.database_subnet_id
  vnet_id                 = module.network.vnet_id
}


