variable "postgresql_server_name" {
  description = "Le nom du serveur PostgreSQL"
  type        = string
}

variable "resource_group_name" {
  description = "Le nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "La localisation des ressources"
  type        = string
}

variable "admin_username" {
  description = "Nom d'utilisateur administrateur"
  type        = string
}

variable "admin_password" {
  description = "Mot de passe administrateur"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Nom de la base de données PostgreSQL"
  type        = string
}
