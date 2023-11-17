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
    use_oidc = true
    subscription_id = "323635f4-82ae-4b1a-a0fe-6a7d6f021834"
    tenant_id = "83bc0644-f514-4a80-9507-efdef8c44c28"
    client_id = "6de22f1d-6350-4fca-9f6e-8c7c784df13d"
  }
}

provider "azurerm" {
  use_oidc = true
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

data "azurerm_client_config" "current" {}