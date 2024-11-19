output "app_service_name" {
  value = module.app_service.app_service_name
}

output "storage_account_name" {
  value = module.blob_storage.storage_account_name
}

output "container_url" {
  value = module.blob_storage.container_url
}

/*output "postgresql_server_name" {
  value = module.database.postgresql_server_name
}*/
