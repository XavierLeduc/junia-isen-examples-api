# Variable : ID de l'abonnement Azure
# Utilisé pour identifier l'abonnement Azure dans lequel les ressources seront déployées.
variable "subscription_id" {
  description = "ID de l'abonnement Azure utilisé pour déployer les ressources."
  type        = string
}

# Variable : Nom du groupe de ressources
# Définit le groupe de ressources Azure qui regroupera logiquement toutes les ressources du projet.
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure dans lequel toutes les ressources seront créées."
  type        = string
  default     = "junia-exe-resource-group"
}

# Variable : Région Azure
# Spécifie la région Azure où les ressources seront déployées. 
# Exemple : "West Europe" pour les déploiements en Europe de l'Ouest.
variable "location" {
  description = "Région Azure où les ressources seront déployées (exemple : 'West Europe')."
  type        = string
}

# Variable : Nom du réseau virtuel (VNet)
variable "vnet_name" {
  description = "Nom du Virtual Network (VNet) utilisé pour le réseau principal."
  type        = string
  default     = "junia-exe-vnet"
}

# Variable : Plage d'adresses pour le VNet
# Détermine la plage d'adresses CIDR utilisée pour le réseau virtuel.
# Exemple : ["10.0.0.0/16"].
variable "address_space" {
  description = "Plage d'adresses CIDR utilisée pour le VNet."
  type        = list(string)
}

# Variable : Nom de l'App Service
variable "app_name" {
  description = "Nom de l'App Service."
  type        = string
  default     = "junia-exe-app-service"
}

# Variable : Nom du plan de service App Service
variable "app_service_plan_name" {
  description = "Nom du plan de service de l'App Service."
  type        = string
  default     = "junia-exe-app-service-plan"
}

# Variable : Nom du compte de stockage Azure
variable "storage_account_name" {
  description = "Nom du compte de stockage Azure."
  type        = string
  default     = "juniaexestorageacct"
}

# Variable : Nom du conteneur blob
variable "container_name" {
  description = "Nom du conteneur dans le compte de stockage Azure."
  type        = string
  default     = "junia-exe-container"
}

# Variable : Nom du serveur PostgreSQL Flexible
variable "postgresql_server_name" {
  description = "Nom unique du serveur PostgreSQL Flexible."
  type        = string
  default     = "junia-exe-postgresql-server"
}

# Variable : Nom d'utilisateur administrateur PostgreSQL
# Définit l'utilisateur ayant les privilèges administrateur sur le serveur PostgreSQL.
variable "admin_username" {
  description = "Nom d'utilisateur administrateur pour PostgreSQL."
  type        = string
}

# Variable : Mot de passe administrateur PostgreSQL
# Définit un mot de passe sécurisé pour l'utilisateur administrateur.
# Cette variable est marquée comme sensible pour éviter qu'elle ne soit affichée dans les journaux ou les sorties Terraform.
variable "admin_password" {
  description = "Mot de passe sécurisé pour l'administrateur PostgreSQL."
  type        = string
  sensitive   = true
}

# Variable : Nom de la base de données PostgreSQL
variable "database_name" {
  description = "Nom de la base de données PostgreSQL."
  type        = string
  default     = "junia-exedb"
}

variable "docker_image" {
    description = "L'image Docker a deployé"
    type        = string
}

variable "blob_subnet_id" {
  description = "ID du subnet pour le Blob Storage Private Endpoint"
  type        = string
}

variable "storage_account_id" {
  description = "ID du compte de stockage Blob"
  type        = string
}

variable "db_subnet_id" {
  description = "ID du subnet pour le PostgreSQL Private Endpoint"
  type        = string
}

variable "postgresql_server_id" {
  description = "ID du serveur PostgreSQL"
  type        = string
}

variable "app_subnet_id" {
  description = "ID du subnet pour l'App Service Private Endpoint"
  type        = string
}

variable "app_service_id" {
  description = "ID du App Service"
  type        = string
}
