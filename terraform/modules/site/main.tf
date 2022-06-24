# module - main.tf

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.site_id}"
  location = var.regions["primary"]
  tags     = local.tags
}
