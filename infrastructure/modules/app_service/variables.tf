variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "app_name" {
  description = "Name of the App Service"
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
