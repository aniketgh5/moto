# main.tf — hardcoded resources with explicit depends_on

# Resource Group (hardcoded)
resource "azurerm_resource_group" "rg" {
  name     = "mahakal"
  location = "centralindia"
}

# Storage Account (hardcoded) - explicitly depends on resource group
resource "azurerm_storage_account" "sa" {
  name                     = "amarnath1230" # must be globally unique; change if conflict
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"


  # explicit dependency (reference already creates implicit dependency, but added per request)
  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Storage Container (hardcoded) - explicitly depends on storage account
resource "azurerm_storage_container" "container" {
  name                  = "mahakal"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"

  depends_on = [
    azurerm_storage_account.sa
  ]
}
