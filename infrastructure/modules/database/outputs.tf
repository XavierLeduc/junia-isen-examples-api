output "postgresql_connection_string" {
  value = "postgresql://${azurerm_postgresql_flexible_server.example.administrator_login}@${azurerm_postgresql_flexible_server.example.fqdn}:5432/${azurerm_postgresql_flexible_server_database.example.name}"
  sensitive = true  
  description = "Chaîne de connexion PostgreSQL"
}
