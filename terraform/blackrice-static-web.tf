# resources.tf

resource "azurerm_resource_group" "rg" {
  name     = "rg-blackrice"
  location = var.regions["primary"]
  tags     = local.tags
}

resource "azurerm_storage_account" "stor" {
  name                      = "stblackrice"
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

resource "azurerm_cdn_profile" "cdnp" {
  name                = "cdnp-blackrice"
  location            = var.regions["cdn"]
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard_Microsoft"
  tags                = local.tags
}

resource "azurerm_cdn_endpoint" "cdne" {
  name                = "cdne-blackrice"
  profile_name        = azurerm_cdn_profile.cdnp.name
  location            = azurerm_cdn_profile.cdnp.location
  resource_group_name = azurerm_resource_group.rg.name
  origin_host_header  = azurerm_storage_account.stor.primary_web_host

  origin {
    name      = "blackriceweb"
    host_name = azurerm_storage_account.stor.primary_web_host
  }

  tags = local.tags

  delivery_rule {
    name  = "spaURLReroute"
    order = "1"

    url_file_extension_condition {
      operator     = "LessThan"
      match_values = ["1"]
    }

    url_rewrite_action {
      destination             = "/index.html"
      preserve_unmatched_path = "false"
      source_pattern          = "/"
    }
  }

  delivery_rule {
    name  = "EnforceHTTPS"
    order = "2"

    request_scheme_condition {
      operator     = "Equal"
      match_values = ["HTTP"]
    }

    url_redirect_action {
      redirect_type = "Found"
      protocol      = "Https"
    }
  }
}
