# Variable : Nom du plan de service App Service
# Cette variable définit le nom du plan de service Azure App Service.
# Le plan de service détermine les caractéristiques de calcul (SKU) et l'environnement (Linux/Windows) utilisé.
variable "app_service_plan_name" {
  description = "Nom du plan de service App Service utilisé pour héberger l'application."
  type        = string
}

# Variable : Nom de l'App Service
# Cette variable définit le nom de l'App Service qui sera déployé.
# Ce nom doit être unique au sein de l'abonnement Azure.
variable "app_name" {
  description = "Nom de l'App Service qui héberge l'application."
  type        = string
}

# Variable : Région Azure
# Cette variable définit la région Azure dans laquelle les ressources seront déployées.
# Exemple de valeurs : "West Europe", "East US", etc.
variable "location" {
  description = "Région Azure où les ressources seront déployées."
  type        = string
}

# Variable : Nom du groupe de ressources
# Cette variable spécifie le groupe de ressources Azure qui contiendra les ressources déployées.
# Le groupe de ressources permet d'organiser les ressources associées d'un projet.
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure qui contiendra les ressources déployées."
  type        = string
}

variable "docker_image" {
  description = "L'image Docker à déployer dans l'App Service"
  type        = string
}
