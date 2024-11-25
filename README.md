# Projet de Cloud Computing

API développée par Fabien Huitelec et code déclaratif de l'infrastructure (Microsoft Azure) utilisant HCL Terraform.

# Description Du Projet 

A propos du projet, nous avons réussi à provisionner une infrastructure cloud sur Microsoft Azure et à déployer une API Python basée sur le framework FastAPI. Il intègre également une pipeline CI/CD configurée avec GitHub Actions pour les tests automatisés, la construction et le déploiement.

# Groupe 

Nous sommes trois élèves en master 2 en cybersécurité à avoir réalisé ce projet, 

    - Emile CORNU, 
    - Xavier LEDUC,
    - Eliot Leleu

# Méthodologie et Architecture 

L’objectif de ce projet est de mettre en pratique les concepts abordés durant les semaines de cours de "cloud computing" à l'école d'ingénieur ISEN Lille. Nous avons donc conçu une architecture et provisionné l’infrastructure sur Microsoft Azure. Une API simple a été déployée, accompagnée d’une base de données PostgreSQL et d’un espace de stockage de fichiers. Ce projet nous permet d'étudier la création et la réalisation d'un cloud pour un besoin spécifique.

# Technos utilités

Nous avons utilisés la version 1.5.7 de Terraform par HashiCorp. 
Nous avons utilisés la version 3.12 de Python 
Nous avons utilisés la version 0.115.0 de FastAPI 

# Structure du projet 

Voici comment notre dépôt GitHub est organisé :

    - .github : contient la déclaration du workflow permettant le CI/CD
    - examples : contient l'API réalisé en python avec le framework FastAPI
    - infrastructure : contient toutes les déclarations d'architecture cloud
    - test : contient les tests unitaires pour les endpoints de l'API, notamment utilisé par le workflow du CI/CD

# Concernant l'installation : 

## Prérequis 

- Version 1.5.7 (minimum) de Terraform : https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
- Version 2.66 (minimum) de Azure CLI : https://learn.microsoft.com/fr-fr/cli/azure/install-azure-cli

## Installation

1. Clonez ce dépôt sur votre machine et ouvrez le avec un IDE quelconque. 
2. Dans ./infrastructure, renommez le fichier "terraform.tfvars.sample" en "terraform.tfvars" et remplissez le avec toutes les informations requises.  
3. Dans le même chemin, exécuter les commandes : "terraform init", "terraform plan" et "terraform apply".
4. Une fois l’infrastructure déployée, créez une table examples dans la base de données PostgreSQL et ajoutez-y des données. 
5. Et voila ! C'est finit pour l'installation !  
