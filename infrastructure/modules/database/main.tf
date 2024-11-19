resource "azurerm_postgresql_server" "postgresql" {
  name                = var.postgresql_server_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "B_Gen5_1"
  storage_mb          = 5120
  version             = "11"  # Version supportée
  administrator_login = var.admin_username
  administrator_login_password = var.admin_password

  ssl_enforcement_enabled       = true
  public_network_access_enabled = false
}

resource "azurerm_postgresql_database" "database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql.name
  charset             = "UTF8"
  collation           = "en_US.UTF8"
}
