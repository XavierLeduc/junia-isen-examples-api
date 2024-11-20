variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
  default     = null
}


variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Location"
  type        = string
}

variable "app_subnet_name" {
  description = "Name of the App Service Subnet"
  type        = string
  default     = "app-subnet"
}

variable "storage_subnet_name" {
  description = "Name of the Storage Subnet"
  type        = string
  default     = "storage-subnet"
}

variable "database_subnet_name" {
  description = "Name of the Database Subnet"
  type        = string
  default     = "database-subnet"
}

