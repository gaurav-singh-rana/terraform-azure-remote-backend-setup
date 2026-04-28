
resource "azurerm_resource_group" "rg_dev_main" {
  name     = var.rg_name
  location = var.rg_location

}

resource "azurerm_storage_account" "sa_tfstate" {
  name                     = "sttfstateci001"
  resource_group_name      = azurerm_resource_group.rg_dev_main.name
  location                 = azurerm_resource_group.rg_dev_main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
    project     = "tfstate"
  }

}

resource "azurerm_storage_container" "sc_tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.sa_tfstate.id
  container_access_type = "private"

}
