# Sortie : Nom du serveur PostgreSQL Flexible
# Fournit le nom du serveur PostgreSQL Flexible créé.
# Utile pour les références dans d'autres scripts ou outils d'intégration (CI/CD, documentation).
output "postgresql_server_name" {
  value = azurerm_postgresql_flexible_server.postgresql.name
}

# Sortie : ID du serveur PostgreSQL Flexible
# Fournit l'ID unique du serveur PostgreSQL Flexible dans Azure.
# Cet ID est utilisé pour des dépendances ou des appels API Azure.
output "postgresql_server_id" {
  value = azurerm_postgresql_flexible_server.postgresql.id
}

# Sortie : Nom de la base de données PostgreSQL
# Fournit le nom de la base de données associée au serveur PostgreSQL Flexible.
# Cela permet de s'assurer que la base de données est correctement configurée et accessible.
output "database_name" {
  value = azurerm_postgresql_flexible_server_database.database.name
}

output "postgresql_private_ip" {
  value = azurerm_postgresql_flexible_server.postgresql.fqdn
}

output "postgresql_fqdn" {
  value = azurerm_postgresql_flexible_server.postgresql.fqdn
  description = "Fully Qualified Domain Name du serveur PostgreSQL"
}