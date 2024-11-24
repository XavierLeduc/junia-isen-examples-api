# Variable définissant le nom du compte de stockage Azure.
variable "storage_account_name" {
  description = "Nom du compte de stockage Azure"
  type        = string
}

# Variable pour définir le nom du conteneur blob.
variable "container_name" {
  description = "Nom du conteneur blob dans le compte de stockage"
  type        = string
}

# Variable spécifiant le groupe de ressources Azure.
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure"
  type        = string
}

# Variable pour indiquer la région Azure.
variable "location" {
  description = "Région Azure où les ressources seront déployées"
  type        = string
}

# Variable définissant l'ID du sous-réseau utilisé par le compte de stockage.
variable "blob_subnet_id" {
  description = "ID du sous-réseau pour les règles réseau du compte de stockage"
  type        = string
}
