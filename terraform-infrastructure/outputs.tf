output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "openai_account_id" {
  value = azurerm_cognitive_account.openai.id
}

output "search_service_name" {
  value = azurerm_search_service.search.name
}
