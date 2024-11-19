variable "postgresql_server_name" {
  description = "Name of the PostgreSQL server"
  type        = string
}

variable "database_name" {
  description = "Name of the PostgreSQL database"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "admin_username" {
  description = "Administrator username for PostgreSQL"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for PostgreSQL"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for PostgreSQL"
  type        = string
}
