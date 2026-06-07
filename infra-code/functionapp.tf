# AI-Ops Function App - Intelligent RCA Engine

# Random suffix (unique names ke liye)
resource "random_string" "aiops_suffix" {
  length  = 6
  special = false
  upper   = false
}

# Storage Account (Function App ke liye zaroori)
resource "azurerm_storage_account" "aiops_func_storage" {
  name                     = "aiopsfunc${random_string.aiops_suffix.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Incident Logging Table (ServiceNow mock)
resource "azurerm_storage_table" "incidents" {
  name                 = "incidents"
  storage_account_name = azurerm_storage_account.aiops_func_storage.name
}

# App Service Plan (Consumption - free tier)
resource "azurerm_service_plan" "aiops_plan" {
  name                = "aiops-function-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "Y1"
}

# Function App
resource "azurerm_linux_function_app" "aiops" {
  name                       = "aiops-rca-func-${random_string.aiops_suffix.result}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = azurerm_service_plan.aiops_plan.id
  storage_account_name       = azurerm_storage_account.aiops_func_storage.name
  storage_account_access_key = azurerm_storage_account.aiops_func_storage.primary_access_key

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.aiops_appinsights.instrumentation_key
    "OPENAI_API_KEY"                 = var.openai_api_key
    "OPENAI_ENDPOINT"                = var.openai_endpoint
    "OPENAI_DEPLOYMENT"              = var.openai_deployment_name
    "STORAGE_CONNECTION_STRING"      = azurerm_storage_account.aiops_func_storage.primary_connection_string
  }

  identity {
    type = "SystemAssigned"
  }
}