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

  identity {
  type = "SystemAssigned"
}

  # Configuration du site (pour les applications Linux Docker ici).
 site_config {
  linux_fx_version = "DOCKER|${var.docker_image}" # Utilise la variable docker_image
}

  # Paramètres de l'application.
  # Ajoutez d'autres paramètres si nécessaire pour votre application.
  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"              # Désactive le stockage local App Service si non requis.
    "STORAGE_ACCOUNT_URL"                 = var.storage_account_url
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = azurerm_app_service.app_service.id
  subnet_id      = var.app_subnet_id # Utilisation de vnet_id
}

resource "azurerm_role_assignment" "app_service_storage_access" {
  principal_id         = azurerm_app_service.app_service.identity[0].principal_id
  role_definition_name = "Storage Blob Data Reader"
  scope                = var.storage_account_id
}


