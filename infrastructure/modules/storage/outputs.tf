# Output :  URL du compte de stockage
output "storage_account_url" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}

# Output : ID du compte de stockage
output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}

# Output: Nom du compte de stockage
output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}


# Output: Nom du container
output "container_name" {
  value = azurerm_storage_container.storage_container.name
}

# Output: URL du container
output "container_url" {
  value = "${azurerm_storage_account.storage_account.primary_blob_endpoint}${azurerm_storage_container.storage_container.name}/"
}