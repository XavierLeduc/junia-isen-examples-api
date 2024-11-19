variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure" # A remplir
  default     = "resource-group" # A remplir
}

variable "location" {
  description = "Localisation des ressources Azure"
  default     = "France Central"# A remplir si différent
}

variable "storage_account_name" {
  description = "Nom du compte de stockage"
  type        = string
}

variable "container_name" {
  description = "Nom du conteneur de stockage"
  type        = string
}
