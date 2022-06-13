# main.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-jootl-data"
    storage_account_name = "storjootl"
    container_name       = "tfstates"
    key                  = "terraform.blackrice.tfstate"
  }
}
