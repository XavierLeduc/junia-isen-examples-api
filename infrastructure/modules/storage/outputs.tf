# Sortie : Nom du compte de stockage
# Fournit le nom du compte de stockage Azure créé.
# Utile pour identifier le compte de stockage dans les scripts ou outils externes.
output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

# Sortie : ID du compte de stockage
# Fournit l'ID unique du compte de stockage Azure.
# Cet ID est utile pour établir des dépendances entre les ressources ou pour des intégrations API.
output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}

# Sortie : Nom du conteneur
# Fournit le nom du conteneur blob créé dans le compte de stockage.
# Utile pour référencer le conteneur dans des applications ou des workflows CI/CD.
output "container_name" {
  value = azurerm_storage_container.storage_container.name
}

# Sortie : URL du conteneur
# Fournit l'ID du conteneur blob.
# Bien qu'il ne s'agisse pas d'une URL directement exploitable, cette information peut être utilisée dans des dépendances ou des outils.
output "container_url" {
  value = azurerm_storage_container.storage_container.id
}


output "storage_account_url" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}



