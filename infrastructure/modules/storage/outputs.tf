output "storage_account_url" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}

# Output: Storage Account Name
output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}


# Output: Container Name
output "container_name" {
  value = azurerm_storage_container.storage_container.name
}

# Output: Container URL
output "container_url" {
  value = "${azurerm_storage_account.storage_account.primary_blob_endpoint}${azurerm_storage_container.storage_container.name}/"
}