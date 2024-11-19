variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure" # A remplir
  default     = "resource-group" # A remplir
}

variable "location" {
  description = "Localisation des ressources Azure"
  default     = "France Central"# A remplir si différent
}

variable "app_service_plan_id" {
  description = "ID du plan de service pour l'App Service"
  type        = string
}

variable "app_name" {
  description = "Nom de l'application web"
  type        = string
}