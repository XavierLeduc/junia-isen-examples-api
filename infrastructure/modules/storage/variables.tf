variable "storage_account_name" {
  description = "Nom du compte de stockage Azure"
  type        = string
}

variable "container_name" {
  description = "Nom du conteneur blob dans le compte de stockage"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure"
  type        = string
}

variable "location" {
  description = "Région Azure où les ressources seront déployées"
  type        = string
}

variable "blob_subnet_id" {
  description = "ID du sous-réseau pour les règles réseau du compte de stockage"
  type        = string
}
