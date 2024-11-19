output "app_service_url" {
  value = azurerm_app_service.example.default_site_hostname
  description = "URL de l'application web"
}