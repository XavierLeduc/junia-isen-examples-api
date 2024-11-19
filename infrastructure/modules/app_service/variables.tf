variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "Région Azure"
  type        = string
}

variable "app_service_plan_id" {
  description = "ID du plan de service pour l'App Service"
  type        = string
}

variable "app_name" {
  description = "Nom de l'application web"
  type        = string
}