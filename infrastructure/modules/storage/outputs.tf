output "storage_account_name" {
  value       = azurerm_storage_account.example.name
  description = "Nom du compte de stockage"
}

output "container_url" {
  value       = "https://${azurerm_storage_account.example.name}.blob.core.windows.net/${azurerm_storage_container.example.name}"
  description = "URL du conteneur de stockage"
}