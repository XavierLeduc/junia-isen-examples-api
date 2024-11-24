output "app_service_name" { #Exporte l'URL de l'appli déployé
  value = azurerm_app_service.app_service.name
}

output "app_service_id" { #Exporte l'ID de l'app service
  value = azurerm_app_service.app_service.id
}
