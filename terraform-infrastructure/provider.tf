# provider.tf
# This file configures the Azure provider to interact with Azure resources.
# It specifies the required provider and its version, along with provider-specific configurations.

terraform {
  required_version = ">= 1.8, < 2.0"
  # Specify the required provider and its version
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"  # Source of the AzureRM provider
      version = "~> 4.30.0"          # Version of the AzureRM provider
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.38.0"
    }
  }
}

provider "azurerm" {
  features {}                        # Enable all features for the AzureRM provider
  subscription_id = var.subscription_id  # Add your subscription ID here
}

provider "azuread" {
  # Defaults are usually sufficient.
}
