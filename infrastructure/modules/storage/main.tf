resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                 = var.location
  account_tier              = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}
