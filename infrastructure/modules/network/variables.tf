# Variable : Nom du réseau virtuel (VNet)
# Définit le nom du Virtual Network (VNet) principal.
# Ce réseau virtuel connecte toutes les ressources Azure de manière sécurisée.
variable "vnet_name" {
  description = "Nom du réseau virtuel (VNet) utilisé pour connecter les ressources Azure."
  type        = string
  default     = null                                   # Valeur par défaut nulle pour permettre une personnalisation.
}

# Variable : Plage d'adresses pour le VNet
# Définit la plage d'adresses CIDR utilisée pour le réseau virtuel (par exemple : ["10.0.0.0/16"]).
variable "address_space" {
  description = "Plage d'adresses CIDR pour le réseau virtuel Azure (VNet)."
  type        = list(string)
}

# Variable : Nom du groupe de ressources
# Définit le groupe de ressources Azure qui contiendra toutes les ressources associées au VNet.
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure où le VNet et ses sous-réseaux seront créés."
  type        = string
}

# Variable : Région Azure
# Spécifie la région Azure où les ressources seront déployées (par exemple : "West Europe").
variable "location" {
  description = "Région Azure où les ressources seront déployées."
  type        = string
}

# Variable : Nom du sous-réseau des applications
# Définit le nom du sous-réseau dédié aux services applicatifs (App Service, etc.).
variable "app_subnet_name" {
  description = "Nom du sous-réseau utilisé pour les services applicatifs, comme Azure App Service."
  type        = string
  default     = "app-subnet"                          # Nom par défaut pour une utilisation standard.
}

# Variable : Nom du sous-réseau de stockage
# Définit le nom du sous-réseau dédié aux ressources de stockage Azure (Storage Accounts, etc.).
variable "storage_subnet_name" {
  description = "Nom du sous-réseau utilisé pour les services de stockage Azure."
  type        = string
  default     = "storage-subnet"                      # Nom par défaut pour une utilisation standard.
}

# Variable : Nom du sous-réseau de la base de données
# Définit le nom du sous-réseau dédié aux bases de données (PostgreSQL Flexible Server, etc.).
# Ce sous-réseau doit être configuré avec une délégation spécifique pour le service concerné.
variable "database_subnet_name" {
  description = "Nom du sous-réseau dédié aux bases de données comme PostgreSQL Flexible Server."
  type        = string
  default     = "database-subnet"                     # Nom par défaut pour une utilisation standard.
}

# Variable permettant d'obtenir des noms aléatoires lors de la création.
variable "random_suffix" {
  description = "Suffixe aléatoire pour rendre les noms uniques"
  type        = string
}