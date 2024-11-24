# Variable définissant le nom du plan de service Azure App Service.
# Le plan de service détermine les caractéristiques de calcul (SKU) et l'environnement utilisé.
variable "app_service_plan_name" {
  description = "Nom du plan de service App Service utilisé pour héberger l'application."
  type        = string
}

# Variable définissant le nom de l'App Service qui sera déployé.
# Ce nom doit être unique au sein de l'abonnement Azure.
variable "app_name" {
  description = "Nom de l'App Service qui héberge l'application."
  type        = string
}

# Variable définissant la région Azure dans laquelle les ressources seront déployées.
variable "location" {
  description = "Région Azure où les ressources seront déployées."
  type        = string
}

# Variable spécifiant le groupe de ressources Azure qui contiendra les ressources déployées.
# Le groupe de ressources permet d'organiser les ressources associées d'un projet.
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure qui contiendra les ressources déployées."
  type        = string
}

# Variable pour spécifier l'image Docker à déployer dans l'App Service.
variable "docker_image" {
  description = "L'image Docker à déployer dans l'App Service"
}

# Variable définissant l'ID du subnet utilisé pour le Private Endpoint de l'App Service.
variable "app_subnet_id" {
  description = "ID du subnet pour l'App Service Private Endpoint"
  type        = string
}

# Variable pour spécifier le nom du Virtual Network (VNet).
variable "vnet_name" {
  description = "Nom du Virtual Network (VNet)"
  type        = string
}

# Variable pour spécifier l'ID du Virtual Network (VNet).
variable "vnet_id" {
  description = "L'ID du Virtual Network (VNet)"
  type        = string
}

# Variable spécifiant l'URL du compte de stockage pour l'accès aux blobs.
variable "storage_account_url" {
  description = "URL du compte de stockage pour l'accès aux blobs."
  type        = string
}

# Variable spécifiant l'ID du compte de stockage Azure pour l'accès aux blobs.
variable "storage_account_id" {
  description = "ID du compte de stockage Azure pour l'accès aux blobs."
  type        = string
}

# Variable définissant l'ID du sous-réseau de stockage.
variable "storage_subnet_id" {
  description = "ID du sous-réseau de stockage"
  type        = string
}


variable "postgresql_server_name" {
  description = "Nom du serveur PostgreSQL"
  type        = string
}

variable "database_name" {
  description = "Nom de la base de données PostgreSQL"
  type        = string
}

variable "admin_username" {
  description = "Nom d'utilisateur administrateur PostgreSQL"
  type        = string
}

variable "admin_password" {
  description = "Mot de passe administrateur PostgreSQL"
  type        = string
  sensitive   = true
}
