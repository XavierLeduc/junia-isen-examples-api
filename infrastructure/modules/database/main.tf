# Ressource : Serveur PostgreSQL Flexible
# Cette ressource déploie un serveur PostgreSQL Flexible dans Azure.
# Le serveur est configuré avec un sous-réseau délégué et utilise une zone DNS privée pour des connexions sécurisées.
resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                = var.postgresql_server_name                 # Nom unique du serveur PostgreSQL.
  location            = var.location                               # Région Azure pour le déploiement.
  resource_group_name = var.resource_group_name                    # Groupe de ressources Azure.
  sku_name            = "B_Standard_B1ms"                         # SKU : Niveau de calcul choisi pour le serveur.
  storage_mb          = 32768                                     # Espace de stockage alloué (32 Go ici).
  version             = "13"                                      # Version de PostgreSQL (exemple : 13).
  administrator_login = var.admin_username                        # Identifiant administrateur pour le serveur.
  administrator_password = var.admin_password                     # Mot de passe administrateur sécurisé.

  delegated_subnet_id = var.subnet_id                              # ID du sous-réseau délégué à PostgreSQL Flexible Server.

  private_dns_zone_id = azurerm_private_dns_zone.postgresql_dns_zone.id # Association avec une zone DNS privée.
  public_network_access_enabled = false                           # Désactivation de l'accès public pour des raisons de sécurité.

  tags = {
    environment = "Production"                                    # Tags pour l'organisation et la gestion des ressources.
  }
  high_availability {
    mode                     = "ZoneRedundant"
    standby_availability_zone = "2"
  }
}

# Ressource : Base de données PostgreSQL
# Cette ressource crée une base de données dans le serveur PostgreSQL Flexible créé précédemment.
resource "azurerm_postgresql_flexible_server_database" "database" {
  name       = var.database_name                                  # Nom de la base de données.
  server_id  = azurerm_postgresql_flexible_server.postgresql.id   # ID du serveur PostgreSQL Flexible associé.
  charset    = "UTF8"                                             # Jeu de caractères pour la base de données.
  collation  = "C"                                                # Collation utilisée pour le tri (généralement 'C' ou 'en_US.UTF8').
}

# Ressource : Zone DNS privée
# Cette ressource configure une zone DNS privée spécifique à PostgreSQL Flexible Server.
# Elle est utilisée pour gérer les connexions sécurisées à l'intérieur du réseau virtuel.
resource "azurerm_private_dns_zone" "postgresql_dns_zone" {
  name                = "privatelink.postgres.database.azure.com" # Nom de la zone DNS privée.
  resource_group_name = var.resource_group_name                  # Groupe de ressources Azure.
}

# Ressource : Lien entre la zone DNS privée et le réseau virtuel
# Cette ressource associe la zone DNS privée PostgreSQL Flexible Server au réseau virtuel.
resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_link" {
  name                  = "postgresql-private-dns-vnet-link"       # Nom unique pour le lien DNS privé.
  resource_group_name   = var.resource_group_name                  # Groupe de ressources Azure.
  private_dns_zone_name = azurerm_private_dns_zone.postgresql_dns_zone.name # Nom de la zone DNS privée.
  virtual_network_id    = var.vnet_id                              # ID du réseau virtuel auquel lier la zone DNS.
}

resource "azurerm_private_endpoint" "postgres_private_endpoint" {
  name                = "postgres-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.db_subnet_id

  private_service_connection {
    name                           = "postgres-connection"
    private_connection_resource_id = var.postgresql_server_id
    is_manual_connection           = false
    subresource_names              = ["postgresql"]
  }
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_vnet" {
  name                = "allow-vnet"
  start_ip_address    = "10.0.0.0"
  end_ip_address      = "10.255.255.255"
  server_id           = var.postgresql_server_id

}
