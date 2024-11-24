# Ressource : Réseau Virtuel (VNet)
# Crée un réseau virtuel Azure (VNet) pour connecter toutes les ressources de manière sécurisée.
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}-${var.random_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

# Ressource : Sous-réseau pour les applications
# Sous-réseau dédié aux services applicatifs, comme Azure App Service.
resource "azurerm_subnet" "app_subnet" {
  name                 = var.app_subnet_name          # Nom du sous-réseau.
  resource_group_name  = var.resource_group_name      # Groupe de ressources Azure.
  virtual_network_name = azurerm_virtual_network.vnet.name # Nom du VNet parent.
  address_prefixes     = ["10.0.1.0/24"]              # Plage d'adresses spécifique pour ce sous-réseau.
  delegation {
    name = "delegation-for-app-service"
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}

# Ressource : Sous-réseau pour le stockage
# Sous-réseau dédié aux ressources de stockage, comme Azure Storage Account.
resource "azurerm_subnet" "storage_subnet" {
  name                 = var.storage_subnet_name      # Nom du sous-réseau.
  resource_group_name  = var.resource_group_name      # Groupe de ressources Azure.
  virtual_network_name = azurerm_virtual_network.vnet.name # Nom du VNet parent.
  address_prefixes     = ["10.0.2.0/24"]              # Plage d'adresses spécifique pour ce sous-réseau.

  service_endpoints = ["Microsoft.Storage"]
}

# Ressource : Sous-réseau pour la base de données
# Sous-réseau dédié au serveur PostgreSQL Flexible. Configure une délégation pour autoriser l'utilisation de ce sous-réseau.
resource "azurerm_subnet" "database_subnet" {
  name                 = var.database_subnet_name     # Nom du sous-réseau.
  resource_group_name  = var.resource_group_name      # Groupe de ressources Azure.
  virtual_network_name = azurerm_virtual_network.vnet.name # Nom du VNet parent.
  address_prefixes     = ["10.0.3.0/24"]              # Plage d'adresses spécifique pour ce sous-réseau.

  # Délégation pour PostgreSQL Flexible Server
  delegation {
    name = "delegation-for-postgresql"               # Nom de la délégation
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers" # Service délégué pour PostgreSQL Flexible Server.
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action", # Autorisations nécessaires.
      ]
    }
  }
}

