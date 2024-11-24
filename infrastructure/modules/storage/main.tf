resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name                 # Nom unique pour le compte de stockage
  resource_group_name      = var.resource_group_name                  # Groupe de ressources passé par le module
  location                 = var.location                             # Région Azure
  account_tier             = "Standard"                              # Niveau de service
  account_replication_type = "LRS"                                   # Type de réplication
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.container_name                          # Nom du conteneur
  storage_account_name  = azurerm_storage_account.storage_account.name # Référence au compte de stockage créé
  container_access_type = "private"                                   # Type d'accès au conteneur
}

resource "azurerm_storage_account_network_rules" "blob_network_rules" {
  storage_account_id         = azurerm_storage_account.storage_account.id # Référence au compte de stockage créé
  default_action             = "Deny"                                    # Action par défaut pour les règles réseau
  virtual_network_subnet_ids = [var.blob_subnet_id]                      # ID du sous-réseau passé en variable
  

  depends_on = [azurerm_storage_account.storage_account]                 # S'assurer que le compte de stockage est créé
}
