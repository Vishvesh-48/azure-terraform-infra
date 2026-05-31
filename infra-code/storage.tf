resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  kind                     = "StorageV2"
  allow_blob_public_access = false
  min_tls_version          = "TLS1_2"

  network_rules {
    default_action = "Allow"
    bypass         = ["AzureServices"]
  }

  tags = {
    environment = "dev"
    project     = "terraform-storage"
  }
}
