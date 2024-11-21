# Sortie : ID du sous-réseau des applications
# Fournit l'ID unique du sous-réseau dédié aux services applicatifs (App Service, etc.).
# Utile pour établir des connexions ou des dépendances entre les ressources.
output "app_subnet_id" {
  value = azurerm_subnet.app_subnet.id
}

# Sortie : ID du sous-réseau de stockage
# Fournit l'ID unique du sous-réseau dédié aux ressources de stockage Azure (comme Storage Accounts).
# Cet ID est souvent utilisé pour attacher des services de stockage au réseau virtuel.
output "storage_subnet_id" {
  value = azurerm_subnet.storage_subnet.id
}

# Sortie : ID du sous-réseau de la base de données
# Fournit l'ID unique du sous-réseau délégué à la base de données PostgreSQL Flexible Server.
# Cet ID est nécessaire pour associer le serveur à ce sous-réseau.
output "database_subnet_id" {
  value = azurerm_subnet.database_subnet.id
}

# Sortie : ID du réseau virtuel (VNet)
# Fournit l'ID unique du réseau virtuel Azure (VNet).
# Utile pour attacher des ressources au réseau virtuel ou établir des liens avec des zones DNS privées.
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
