# Sortie : Nom de l'App Service
# Cette sortie fournit le nom de l'App Service créé, utile pour les références ou les outils de déploiement CI/CD.
output "app_service_name" {
  value = azurerm_app_service.app_service.name
}

# Sortie : ID de l'App Service
# Cette sortie fournit l'ID unique de l'App Service dans Azure. 
# L'ID est souvent utilisé pour définir des dépendances ou effectuer des actions spécifiques via l'API Azure.
output "app_service_id" {
  value = azurerm_app_service.app_service.id
}

output "app_service_private_endpoint_ip" {
  description = "Adresse IP privée du Private Endpoint pour l'App Service"
  value       = azurerm_private_endpoint.app_service_private_endpoint.private_service_connection[0].private_ip_address
}

