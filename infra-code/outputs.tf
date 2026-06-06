output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}
output "application_insights_id" {
  value = azurerm_application_insights.aiops_appinsights.id
}

output "log_analytics_id" {
  value = azurerm_log_analytics_workspace.aiops_logs.id
}
