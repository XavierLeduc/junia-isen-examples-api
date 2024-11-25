resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                = var.postgresql_server_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "B_Standard_B2s"
  storage_mb          = 32768
  version             = "13"
  administrator_login = var.admin_username
  administrator_password = var.admin_password

  delegated_subnet_id = var.subnet_id
  private_dns_zone_id = azurerm_private_dns_zone.postgresql_dns_zone.id
  public_network_access_enabled = false

  tags = {
    environment = "Production"
  }
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  name       = var.database_name
  server_id  = azurerm_postgresql_flexible_server.postgresql.id
  charset    = "UTF8"
  collation  = "C"
}

resource "azurerm_private_dns_zone" "postgresql_dns_zone" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_link" {
  name                  = "postgresql-private-dns-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.postgresql_dns_zone.name
  virtual_network_id    = var.vnet_id
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_vnet" {
  name                = "allow-vnet"
  start_ip_address    = "10.0.0.0"
  end_ip_address      = "10.255.255.255"
  server_id           = azurerm_postgresql_flexible_server.postgresql.id
}