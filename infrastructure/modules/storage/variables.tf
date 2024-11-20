variable "storage_account_name" {
  description = "Name of the storage account"
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

variable "container_name" {
  description = "Name of the storage container"
  type        = string
}
