# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {

  required_version = ">=1.5.6"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.71.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "=4.0"
    }
    random = {
      source = "hashicorp/random"
      version = "=3.4.3"
    }
  }
  backend "azurerm" {
    resource_group_name = "rg-terraformbackend"
    storage_account_name = "stppolzdterraformbackend"
    container_name = "ghlztfstate"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
    features {
      key_vault {
        purge_soft_delete_on_destroy = true
        recover_soft_deleted_key_vaults = true
      }
    }
}

data "azurerm_client_config" "current" {}