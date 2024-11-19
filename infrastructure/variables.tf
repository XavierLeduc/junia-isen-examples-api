

variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure" # A remplir
  default     = "resource-group" # A remplir
}

variable "location" {
  description = "Localisation des ressources Azure"
  default     = "France Central"# A remplir si différent
}

#### Identity

variable "subscription_id" {
  description = "subscription id"
  type = string
}

variable "email" {
  description = "adresse mail"
  type = string
}

#### APP

variable "app_name" {
  description = "Nom de l'application web"
  type        = string
  
}

#### Storage

variable "storage_account_name" {
  description = "Nom du compte de stockage"
  type        = string
}

variable "container_name" {
  description = "Nom du conteneur de stockage"
  type        = string
}

#### Database

variable "postgresql_server_name" {
  description = "Nom du serveur PostgreSQL"
  type        = string
}

variable "database_name" {
  description = "Nom de la base de données PostgreSQL"
  type        = string
}

variable "admin_username" {
  description = "Nom d'utilisateur administrateur du serveur PostgreSQL"
  type        = string
}

variable "admin_password" {
  description = "Mot de passe administrateur pour le serveur PostgreSQL"
  type        = string
}

variable "subnet_id" {
  description = "L'ID du sous-réseau dans lequel le serveur PostgreSQL sera déployé"
  type        = string
}