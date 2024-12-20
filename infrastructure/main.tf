# Génération d'un ID aléatoire pour avoir des noms uniques
resource "random_id" "unique_suffix" {
  byte_length = 4
}

# Providers
#Configure le fournisseur Azure et active les fonctionnalités nécessaires.
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
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  random_suffix       = random_id.unique_suffix.hex
}

# Module de l'App Service
module "app_service" {
  source                = "./modules/app_service"
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
  app_name              = "${var.app_name}-${random_id.unique_suffix.hex}"
  app_service_plan_name = "${var.app_service_plan_name}-${random_id.unique_suffix.hex}"
  docker_image          = var.docker_image
  app_subnet_id         = module.network.app_subnet_id
  vnet_name             = module.network.vnet_name
  vnet_id               = module.network.vnet_id
  storage_subnet_id     = module.network.storage_subnet_id
  storage_account_url   = module.blob_storage.storage_account_url
  storage_account_id    = module.blob_storage.storage_account_id

  postgresql_fqdn       = module.database.postgresql_fqdn

  # Variables PostgreSQL
  postgresql_server_name = module.database.postgresql_server_name
  database_name          = module.database.database_name
  admin_username         = var.admin_username
  admin_password         = var.admin_password
}

# Module du Blob_storage 
module "blob_storage" {
  source                = "./modules/storage"
  storage_account_name  = substr("${var.storage_account_name}${random_id.unique_suffix.hex}", 0, 24)
  container_name        = var.container_name
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
  blob_subnet_id        = module.network.storage_subnet_id
}

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




  db_subnet_id            = module.network.database_subnet_id
  postgresql_server_id    = module.database.postgresql_server_id

  depends_on = [module.network]
}

locals {
  blob_subnet_id       = module.network.storage_subnet_id
  storage_account_id   = module.blob_storage.storage_account_name
  db_subnet_id         = module.network.database_subnet_id
  app_subnet_id        = module.network.app_subnet_id
}
