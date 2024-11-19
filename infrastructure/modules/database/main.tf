/*resource "azurerm_postgresql_flexible_server" "example" {
  name                      = var.postgresql_server_name
  resource_group_name        = var.resource_group_name
  location                  = var.location
  administrator_login       = var.admin_username  # Nom d'utilisateur administrateur
  administrator_password    = var.admin_password

  version                   = "13"  # Version PostgreSQL (changez selon vos besoins)

  sku_name                  = "B_Standard_B1ms"   # Choix d'un SKU valide
  storage_mb                = 32768               # Taille du stockage en Mo (doit être un nombre valide)

  backup_retention_days     = 7                  # Durée des sauvegardes

 
  tags = {
    environment = "Production"
  }

}

# Création de la base de données PostgreSQL sur le serveur flexible
resource "azurerm_postgresql_flexible_server_database" "example" {
  name                      = var.database_name
  server_id                 = azurerm_postgresql_flexible_server.example.id  # Utilisation de l'ID du serveur

  charset                   = "UTF8"        # Jeu de caractères
  collation                 = "en_US"  # Collation correcte
}
*/