#Def du compte de stockage Azure, utilisé pour héberger des données
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Création d'un conteneur de stockage dans le compte Azure Storage, ils permettent d'organiser les blobs.
resource "azurerm_storage_container" "storage_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

# Ajout d'un blob (fichier) au conteneur de stockage.
resource "azurerm_storage_blob" "quotes_blob" {
  name                   = "quotes.json"  
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  source                 = "${path.module}/quotes.json"
}
