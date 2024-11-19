output "app_subnet_id" {
  value = azurerm_subnet.app_subnet.id
}

output "db_subnet_id" {
  value = azurerm_subnet.db_subnet.id
}

output "storage_subnet_id" {
  value = azurerm_subnet.storage_subnet.id
}
