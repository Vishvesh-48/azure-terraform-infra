terraform {
   backend "azurerm" {
    resource_group_name  = "rg-tfstate-devops"
    storage_account_name = "tfstatevishdevops001"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}