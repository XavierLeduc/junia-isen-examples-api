# Création d'un plan de service Azure App Service.
# Ce plan détermine les caractéristiques de calcul et le système d'exploitation utilisés.
resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name                 # Nom du plan de service.
  location            = var.location                              # Région Azure pour le déploiement.
  resource_group_name = var.resource_group_name                   # Groupe de ressources Azure.
  os_type             = "Linux"                                  # Remplacez par "Windows" si nécessaire.
  sku_name            = "B1"                                     # Niveau de tarification : remplacez par le SKU adapté (ex: S1, P1V2).
}

# Déploiement d'un App Service lié au plan de service créé précédemment.
resource "azurerm_app_service" "app_service" {
  depends_on          = [azurerm_service_plan.app_service_plan]   # S'assure que le plan de service est créé avant l'App Service.
  name                = var.app_name                             # Nom de l'App Service.
  location            = var.location                             # Région Azure pour le déploiement.
  resource_group_name = var.resource_group_name                  # Groupe de ressources Azure.
  app_service_plan_id = azurerm_service_plan.app_service_plan.id # ID du plan de service lié.

  # Configuration du site (pour les applications Linux Docker ici).
  site_config {
    linux_fx_version = "DOCKER|mcr.microsoft.com/dotnet/aspnet:6.0" # Image Docker utilisée (exemple: ASP.NET Core 6.0).
  }

  # Paramètres de l'application.
  # Ajoutez d'autres paramètres si nécessaire pour votre application.
  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"              # Désactive le stockage local App Service si non requis.
  }
}

resource "azurerm_private_endpoint" "app_service_private_endpoint" {
  name                = "app-service-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.app_subnet_id

  private_service_connection {
    name                           = "app-service-connection"
    private_connection_resource_id = var.app_service_id
    is_manual_connection           = false
    subresource_names              = ["sites"]
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = var.app_service_id
  subnet_id      = var.app_subnet_id
}
