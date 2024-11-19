variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure" # A remplir
  default     = "resource-group" # A remplir
}

variable "location" {
  description = "Localisation des ressources Azure"
  default     = "France Central"# A remplir si différent
}

variable "vnet_name" {
    description = "Nom du VNet"
    type = string
}

variable "address_space" {
    description = "Espace des adresses IP"
}

variable "app_subnet_name" {
    description = "Nom du subnet de l'App Service"
    type = string
}

variable "storage_subnet_name" {
    description = "Nom du subnet du Blob Storage"
    type = string
}