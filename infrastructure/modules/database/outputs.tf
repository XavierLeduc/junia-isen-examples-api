output "postgresql_server_name" {
  value = azurerm_postgresql_flexible_server.postgresql.name
}

output "postgresql_server_id" {
  value = azurerm_postgresql_flexible_server.postgresql.id
}

output "database_name" {
  value = azurerm_postgresql_flexible_server_database.database.name
}
  