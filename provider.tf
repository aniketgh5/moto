terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}

  subscription_id = "b35c9afa-9045-49a7-852b-e7bffe5ca332"

  resource_provider_registrations = "none"
}
