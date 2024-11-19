output "app_service_url" {
  value = azurerm_app_service.junia-app-service.default_site_hostname
  description = "URL de l'application web"
}