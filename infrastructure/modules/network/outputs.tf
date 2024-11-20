output "app_subnet_id" {
  value = azurerm_subnet.app_subnet.id
}

output "storage_subnet_id" {
  value = azurerm_subnet.storage_subnet.id
}

output "database_subnet_id" {
  value = azurerm_subnet.database_subnet.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
