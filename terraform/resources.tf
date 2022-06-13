# resources.tf

resource "azurerm_resource_group" "rg-jootl-blackrice" {
  name     = "rg-jootl-blackrice"
  location = var.location

  tags = {
    product     = local.product
    environment = var.environment
  }
}

resource "azurerm_storage_account" "storblackrice" {
  name                      = "storblackrice"
  resource_group_name       = azurerm_resource_group.rg-jootl-blackrice.name
  location                  = azurerm_resource_group.rg-jootl-blackrice.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
  }

  tags = {
    product     = local.product
    environment = var.environment
  }
}
