resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.app_service_plan.id
 
  identity { 
    type = "SystemAssigned"
  }

  site_config {
    linux_fx_version = "DOCKER|${var.docker_image}"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "STORAGE_ACCOUNT_URL"                 = var.storage_account_url

    # Variables de connexion à la base de données PostgreSQL
    "DATABASE_HOST"                       = var.postgresql_fqdn
    "DATABASE_PORT"                       = "5432"
    "DATABASE_NAME"                       = var.database_name
    "DATABASE_USER"                       = "${var.admin_username}@${var.postgresql_server_name}"
    "DATABASE_PASSWORD"                   = var.admin_password
  }
}

resource "azurerm_role_assignment" "app_service_storage_access" {
  principal_id         = azurerm_app_service.app_service.identity[0].principal_id
  role_definition_name = "Storage Blob Data Reader"
  scope                = var.storage_account_id
}

resource "azurerm_app_service_virtual_network_swift_connection" "app_service_vnet_integration" {
  app_service_id = azurerm_app_service.app_service.id
  subnet_id      = var.app_subnet_id
}
