resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux" # Remplacez par "Windows" si nécessaire
  sku_name            = "B1"    # Niveau de tarification, remplacez par ce dont vous avez besoin
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.app_service_plan.id

  site_config {
    linux_fx_version = "DOCKER|mcr.microsoft.com/dotnet/aspnet:6.0"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}
