# Variable : Nom du serveur PostgreSQL Flexible
# Définit le nom unique du serveur PostgreSQL Flexible.
# Ce nom doit respecter les règles de nommage Azure (par exemple : alphanumérique, sans espaces).
variable "postgresql_server_name" {
  description = "Nom unique du serveur PostgreSQL Flexible."
  type        = string
}

# Variable : Nom de la base de données PostgreSQL
# Définit le nom de la base de données associée au serveur PostgreSQL Flexible.
# Ce nom sera utilisé pour créer une base de données par défaut sur le serveur.
variable "database_name" {
  description = "Nom de la base de données PostgreSQL."
  type        = string
}

# Variable : Région Azure
# Spécifie la région Azure où les ressources seront déployées.
# Exemple : "West Europe", "East US".
variable "location" {
  description = "Région Azure où les ressources seront déployées."
  type        = string
}

# Variable : Nom du groupe de ressources
# Définit le groupe de ressources Azure qui contiendra le serveur PostgreSQL Flexible et ses ressources associées.
# Permet d'organiser les ressources logiquement dans Azure.
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure."
  type        = string
}

# Variable : Nom d'utilisateur administrateur pour PostgreSQL
# Spécifie le nom d'utilisateur administrateur du serveur PostgreSQL.
# Cet utilisateur aura des privilèges complets sur le serveur et les bases de données.
variable "admin_username" {
  description = "Nom d'utilisateur administrateur pour PostgreSQL."
  type        = string
}

# Variable : Mot de passe administrateur pour PostgreSQL
# Spécifie le mot de passe sécurisé pour l'utilisateur administrateur du serveur PostgreSQL.
# Cette variable est marquée comme sensible pour éviter qu'elle ne soit affichée dans les journaux Terraform.
variable "admin_password" {
  description = "Mot de passe sécurisé pour l'administrateur PostgreSQL."
  type        = string
  sensitive   = true
}

# Variable : ID du sous-réseau délégué pour PostgreSQL Flexible Server
# Spécifie l'ID du sous-réseau dans lequel le serveur PostgreSQL Flexible sera déployé.
# Ce sous-réseau doit être configuré avec une délégation pour "Microsoft.DBforPostgreSQL/flexibleServers".
variable "subnet_id" {
  description = "ID du sous-réseau délégué pour PostgreSQL Flexible Server."
  type        = string
}

# Variable : ID du réseau virtuel
# Définit l'ID du réseau virtuel associé à la zone DNS privée pour le serveur PostgreSQL.
# Permet de sécuriser les communications entre les services dans le réseau.
variable "vnet_id" {
  description = "ID du réseau virtuel associé à PostgreSQL Flexible Server."
  type        = string
}

# Variable définissant ID du sous réseau
variable "db_subnet_id" {
  description = "ID du subnet pour le PostgreSQL Private Endpoint"
  type        = string
}

# Varaible définissant l'ID du serveur Postgre
variable "postgresql_server_id" {
  description = "ID du serveur PostgreSQL"
  type        = string
}

