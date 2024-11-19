variable "storage_account_name" {
  description = "Nom du compte de stockage"
  type        = string
}

variable "container_name" {
  description = "Nom du conteneur de stockage"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "Localisation du groupe de ressources"
  type        = string
}