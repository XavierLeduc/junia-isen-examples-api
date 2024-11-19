output "app_service_url" {
  value = module.app_service.app_service_url
  description = "URL de l'application web"
}

output "storage_account_name" {
  value = module.blob_storage.storage_account_name
}

output "container_url" {
  value = module.blob_storage.container_url
}

output "postgresql_connection_string" {
  value = module.postgresql.postgresql_connection_string
  description = "Chaîne de connexion PostgreSQL"
  sensitive = true
}