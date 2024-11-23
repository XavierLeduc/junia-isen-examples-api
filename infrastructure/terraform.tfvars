# ID de l'abonnement Azure
# Utilisé pour identifier l'abonnement dans lequel les ressources seront créées.
subscription_id = "3c96b4c4-ced5-4fb1-9e04-d1bae26448dd"

# Nom du groupe de ressources
# Groupe Azure qui regroupe logiquement toutes les ressources associées à ce projet.
resource_group_name = "junia-exe-ressource-group12"

# Région Azure
# Spécifie la région où toutes les ressources seront déployées.
# Exemple : "North Europe" pour les serveurs situés en Europe du Nord.
location = "North Europe"

# Nom du réseau virtuel (VNet)
# Le réseau virtuel Azure qui connecte toutes les ressources de manière sécurisée.
vnet_name = "junia-exe-vnet12"

# Plage d'adresses CIDR pour le VNet
# Spécifie la plage d'adresses utilisée par le réseau virtuel.
address_space = ["10.0.0.0/16"]

# Nom du service applicatif (App Service)
# Détermine le nom unique de l'App Service dans Azure.
app_name = "junia-exe-app-service12"

# Nom du plan de service App Service
# Définit le plan de service utilisé par l'App Service pour ses ressources de calcul.
app_service_plan_name = "junia-exe-app-service-plan12"

# Nom du compte de stockage
# Le compte de stockage utilisé pour héberger des blobs ou d'autres ressources.
storage_account_name = "juniaexestorageacct12"

# Nom du conteneur blob
# Conteneur dans le compte de stockage pour stocker des fichiers ou des données.
container_name = "junia-exe-container12"

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

blob_subnet_id      = "/subscriptions/3c96b4c4-ced5-4fb1-9e04-d1bae26448dd/resourceGroups/junia-exe-ressource-group12/providers/Microsoft.Network/virtualNetworks/junia-exe-vnet12/subnets/storage-subnet"
storage_account_id  = "/subscriptions/3c96b4c4-ced5-4fb1-9e04-d1bae26448dd/resourceGroups/junia-exe-ressource-group12/providers/Microsoft.Storage/storageAccounts/juniaexestorageacct12"

db_subnet_id        = "/subscriptions/3c96b4c4-ced5-4fb1-9e04-d1bae26448dd/resourceGroups/junia-exe-ressource-group12/providers/Microsoft.Network/virtualNetworks/junia-exe-vnet12/subnets/database-subnet"
postgresql_server_id = "/subscriptions/3c96b4c4-ced5-4fb1-9e04-d1bae26448dd/resourceGroups/junia-exe-ressource-group12/providers/Microsoft.DBforPostgreSQL/flexibleServers/junia-exe-postgresql-server12"

app_subnet_id       = "/subscriptions/3c96b4c4-ced5-4fb1-9e04-d1bae26448dd/resourceGroups/junia-exe-ressource-group12/providers/Microsoft.Network/virtualNetworks/junia-exe-vnet12/subnets/app-subnet"
app_service_id      = "/subscriptions/3c96b4c4-ced5-4fb1-9e04-d1bae26448dd/resourceGroups/junia-exe-ressource-group12/providers/Microsoft.Web/sites/junia-exe-app-service12"


