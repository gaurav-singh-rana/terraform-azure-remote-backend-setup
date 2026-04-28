terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg_dev"
    storage_account_name = "rgdevsa"
    container_name       = "rgdevsecure"
    key                  = "terraform.tfstate"

  }
}