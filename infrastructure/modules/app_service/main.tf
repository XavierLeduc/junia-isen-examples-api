resource "azurerm_service_plan" "app_service_plan" { #Création du service Azure pour les applis web
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_app_service" "app_service" { #Déploiement de l'appli
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.app_service_plan.id
 
  identity { 
    type = "SystemAssigned"
  }

  site_config { #L'appli utilise une image Docker
    linux_fx_version = "DOCKER|${var.docker_image}"
  }

  app_settings = { #Définition de paramètres d'applications
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "STORAGE_ACCOUNT_URL"                 = var.storage_account_url

    # Variables de connexion à la base de données PostgreSQL
    "DATABASE_HOST"                       = "${var.postgresql_server_name}.postgres.database.azure.com"
    "DATABASE_PORT"                       = "5432"
    "DATABASE_NAME"                       = var.database_name
    "DATABASE_USER"                       = "${var.admin_username}@${var.postgresql_server_name}"
    "DATABASE_PASSWORD"                   = var.admin_password
    
  }
}

resource "azurerm_role_assignment" "app_service_storage_access" {
  #Permet à l'appli d'accéder au stockage 
  principal_id         = azurerm_app_service.app_service.identity[0].principal_id
  role_definition_name = "Storage Blob Data Reader"
  scope                = var.storage_account_id
}
