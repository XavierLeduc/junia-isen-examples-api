# Nom du service applicatif déployé (App Service).
output "app_service_name" {
  value = module.app_service.app_service_name
}

# Nom du compte de stockage créé.
output "storage_account_name" {
  value = module.blob_storage.storage_account_name
}

# URL du conteneur blob.
output "container_url" {
  value = module.blob_storage.container_url
}

# Nom du serveur PostgreSQL Flexible déployé.
output "postgresql_server_name" {
  value = module.database.postgresql_server_name
}
