# Ressource : Compte de stockage Azure
# Crée un compte de stockage Azure pour stocker des données dans des conteneurs blob.
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name           # Nom unique du compte de stockage (doit être en minuscules).
  resource_group_name      = var.resource_group_name            # Groupe de ressources Azure où le compte sera créé.
  location                 = var.location                       # Région Azure où le compte de stockage sera déployé.
  account_tier             = "Standard"                        # Niveau de performance : "Standard" pour un coût optimisé.
  account_replication_type = "LRS"                             # Type de réplication : "LRS" (Local Redundant Storage).
}

# Ressource : Conteneur de stockage
# Crée un conteneur blob dans le compte de stockage Azure pour stocker des fichiers ou données.
resource "azurerm_storage_container" "storage_container" {
  name                  = var.container_name                    # Nom unique du conteneur dans le compte de stockage.
  storage_account_name  = azurerm_storage_account.storage_account.name # Nom du compte de stockage associé.
  container_access_type = "private"                             # Type d'accès au conteneur : "private" pour limiter l'accès.
}

resource "azurerm_private_endpoint" "blob_private_endpoint" {
  name                = "blob-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name 
  subnet_id           = var.blob_subnet_id

  private_service_connection {
    name                           = "blob-connection"
    private_connection_resource_id = var.storage_account_id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}

resource "azurerm_storage_account_network_rules" "blob_network_rules" {
  storage_account_id         = var.storage_account_id
  default_action             = "Deny"
  virtual_network_subnet_ids = [var.blob_subnet_id]
}
