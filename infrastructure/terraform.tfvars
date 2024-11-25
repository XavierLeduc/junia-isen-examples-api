# ID de l'abonnement Azure
# Utilisé pour identifier l'abonnement dans lequel les ressources seront créées.
subscription_id = "0e2289e6-99f2-4e54-b3ba-47212bcdd42e"

# Nom du groupe de ressources
# Groupe Azure qui regroupe logiquement toutes les ressources associées à ce projet.
resource_group_name = "junia-exe-ressource-xavier"

# Région Azure
# Spécifie la région où toutes les ressources seront déployées.
# Exemple : "North Europe" pour les serveurs situés en Europe du Nord.
location = "uksouth"

# Nom du réseau virtuel (VNet)
# Le réseau virtuel Azure qui connecte toutes les ressources de manière sécurisée.
vnet_name = "junia-exe-vnet12"

# Plage d'adresses CIDR pour le VNet
# Spécifie la plage d'adresses utilisée par le réseau virtuel.
address_space = ["10.0.0.0/16"]

# Nom du service applicatif (App Service)
# Détermine le nom unique de l'App Service dans Azure.
app_name = "junia-exe-app-service"

# Nom du plan de service App Service
# Définit le plan de service utilisé par l'App Service pour ses ressources de calcul.
app_service_plan_name = "junia-exe-app-service-plan"

# Nom du compte de stockage
# Le compte de stockage utilisé pour héberger des blobs ou d'autres ressources.
storage_account_name = "juniaexestorageacct12"

# Nom du conteneur blob
# Conteneur dans le compte de stockage pour stocker des fichiers ou des données.
container_name = "api"

# Nom du serveur PostgreSQL Flexible
# Nom unique pour le serveur PostgreSQL Flexible créé dans Azure.
postgresql_server_name = "junia-exe-postgresql-server12"

# Nom d'utilisateur administrateur PostgreSQL
# Identifiant utilisé pour administrer le serveur PostgreSQL.
admin_username = "adminuser"

# Mot de passe administrateur PostgreSQL
# Mot de passe sécurisé pour l'utilisateur administrateur PostgreSQL.
admin_password = "SuperSecurePassword123" # Assurez-vous de sécuriser cette variable dans des environnements sensibles.

# Nom de la base de données PostgreSQL
# Nom de la base de données créée par défaut sur le serveur PostgreSQL.
database_name = "junia-exedb12"

