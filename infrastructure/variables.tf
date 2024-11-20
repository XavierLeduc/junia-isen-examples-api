variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "app_name" {
  description = "App Service Name"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}

variable "container_name" {
  description = "Storage Container Name"
  type        = string
}

variable "postgresql_server_name" {
  description = "PostgreSQL Server Name"
  type        = string
}

variable "admin_username" {
  description = "PostgreSQL Admin Username"
  type        = string
}

variable "admin_password" {
  description = "PostgreSQL Admin Password"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Database Name"
  type        = string
}
