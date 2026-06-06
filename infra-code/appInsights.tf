# Application Insights
resource "azurerm_application_insights" "aiops_appinsights" {
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = azurerm_log_analytics_workspace.aiops_logs.id
  application_type    = var.app_insights_type
}