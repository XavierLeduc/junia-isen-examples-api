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
  storage_account_id         = azurerm_storage_account.storage_account.id
  default_action             = "Deny"
  virtual_network_subnet_ids = [var.blob_subnet_id]
  
  bypass = ["AzureServices"] # Autorise les services Azure à accéder au compte de stockage
}

resource "azurerm_storage_blob" "quotes_blob" {
  name                   = "quotes.json" # Nom du fichier dans le conteneur
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  source                 = "${path.module}/quotes.json" # Chemin local du fichier
}