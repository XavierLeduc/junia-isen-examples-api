output "storage_account_name" {
  value       = azurerm_storage_account.junia-storage-account.name
  description = "Nom du compte de stockage"
}

output "container_url" {
  value       = "https://${azurerm_storage_account.junia-storage-account.name}.blob.core.windows.net/${azurerm_storage_container.junia-storage-container.name}"
  description = "URL du conteneur de stockage"
}