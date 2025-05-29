variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group for the AI Foundry Project"
  type        = string
}

variable "keyvault_name" {
  description = "The name of the key vault"
  type        = string
}

variable "aiservices_name" {
  description = "The name of the AI services account"
  type        = string
}

variable "aifoundry_name" {
  description = "The name of the AI Foundry Hub"
  type        = string
}

variable "aifoundryproject_name" {
  description = "The name of the AI Foundry Project"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "openai_account_name" {
  description = "Name of the Azure OpenAI (Cognitive Services) account"
  type        = string
}

variable "search_service_name" {
  description = "Name of the Azure Cognitive Search service"
  type        = string
}

variable "developer_principal_id" {
  description = "Principal ID for the Azure AI Developer (assigned at the resource group level)"
  type        = string
}

variable "openai_user_object_id" {
  description = "Object ID for the Cognitive Services Open AI User (assigned at the resource group level)"
  type        = string
}
