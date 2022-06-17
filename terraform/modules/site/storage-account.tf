# storage-account.tf

resource "azurerm_storage_account" "stor" {
  name                      = "st${var.site_id}"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
  }

  tags = local.tags
}
