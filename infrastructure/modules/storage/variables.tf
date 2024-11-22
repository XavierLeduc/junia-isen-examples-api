# Variable : Nom du compte de stockage Azure
# Définit le nom unique du compte de stockage Azure.
# Le nom doit respecter les contraintes Azure : entre 3 et 24 caractères, uniquement en minuscules et alphanumériques.
variable "storage_account_name" {
  description = "Nom unique du compte de stockage Azure."
  type        = string
}

# Variable : Région Azure
# Spécifie la région Azure dans laquelle le compte de stockage et le conteneur seront déployés.
# Exemples : "West Europe", "East US".
variable "location" {
  description = "Région Azure où les ressources de stockage seront créées."
  type        = string
}

# Variable : Nom du groupe de ressources
# Définit le groupe de ressources Azure contenant le compte de stockage.
# Ce groupe organise logiquement les ressources liées à un projet ou une application.
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure où le compte de stockage sera créé."
  type        = string
}

# Variable : Nom du conteneur blob
# Définit le nom du conteneur blob à créer dans le compte de stockage.
# Ce conteneur est utilisé pour stocker des fichiers ou des objets dans Azure Blob Storage.
variable "container_name" {
  description = "Nom du conteneur blob dans le compte de stockage Azure."
  type        = string
}

variable "blob_subnet_id" {
  description = "ID du subnet pour le Blob Storage Private Endpoint"
  type        = string
}

variable "storage_account_id" {
  description = "ID du compte de stockage Blob"
  type        = string
}

