// Retrieve client config – helpful for role assignments.
data "azurerm_client_config" "example" {}

// Optionally, retrieve your own Azure AD user info.
data "azuread_user" "current" {
  object_id = data.azurerm_client_config.example.object_id
}

// Resource Group 
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Project = "AI Agents"
  }
}

// Key Vault 
resource "azurerm_key_vault" "example" {
  name                = var.keyvault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.example.tenant_id

  sku_name                 = "standard"
  purge_protection_enabled = true
}

// Key Vault Policies 
resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.example.tenant_id
  object_id    = data.azurerm_client_config.example.object_id

  key_permissions = [
    "Create",
    "Get",
    "Delete",
    "Purge",
    "GetRotationPolicy",
  ]
}

// Storage Account 
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

// AI Services Account 
resource "azurerm_ai_services" "aiserviceaccount" {
  name                = "aiservicesbx1test"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "S0"
}

// AI Foundry
resource "azurerm_ai_foundry" "aifoundry" {
  name                = "aifoundrytestbx1"
  location            = azurerm_ai_services.aiserviceaccount.location
  resource_group_name = azurerm_ai_services.aiserviceaccount.resource_group_name
  storage_account_id  = azurerm_storage_account.example.id
  key_vault_id        = azurerm_key_vault.example.id

  identity {
    type = "SystemAssigned"
  }

}

// AI Foundry Project 
resource "azurerm_ai_foundry_project" "aiproject" {
  name               = "projectnametestbx1"
  location           = azurerm_ai_foundry.aifoundry.location
  ai_services_hub_id = azurerm_ai_foundry.aifoundry.id

  identity {
    type = "SystemAssigned"
  }
}


// Azure Open AI (Cognitive Services) Account
resource "azurerm_cognitive_account" "openai" {
  name                = var.openai_account_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "S0"
  kind                = "OpenAI"
  tags = {
    Project = "AI Agents"
  }
}

// Azure Cognitive Search Service
resource "azurerm_search_service" "search" {
  name                = var.search_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "standard"
  partition_count     = 1
  replica_count       = 1
  tags = {
    Project = "AI Agents"
  }
}


// Role Assignments for Permissions
resource "azurerm_role_assignment" "ai_developer" {
  principal_id         = var.developer_principal_id # or object_id
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Azure AI Developer"
}

resource "azurerm_role_assignment" "openai_user" {
  principal_id         = var.openai_user_object_id # or we can use object_id
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Cognitive Services OpenAI User"
}


