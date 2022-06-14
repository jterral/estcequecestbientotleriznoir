# resources.tf

resource "azurerm_resource_group" "resource-group" {
  name     = "rg-jootl-blackrice"
  location = var.location

  tags = {
    product     = local.product
    environment = var.environment
  }
}

resource "azurerm_storage_account" "storage-account" {
  name                      = "storblackrice"
  resource_group_name       = azurerm_resource_group.resource-group.name
  location                  = azurerm_resource_group.resource-group.location
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

resource "azurerm_cdn_profile" "static-web-cdnprofile" {
  name                = "static-web-blackrice-cdnprofile"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  sku                 = "Standard_Microsoft"

  tags = {
    product     = local.product
    environment = var.environment
  }
}

resource "azurerm_cdn_endpoint" "static-web-endpoint" {
  name                = "static-web-blackrice-endpoint"
  profile_name        = azurerm_cdn_profile.static-web-cdnprofile.name
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  origin_host_header  = azurerm_storage_account.storage-account.primary_web_host

  origin {
    name      = "blackriceweb"
    host_name = azurerm_storage_account.storage-account.primary_web_host
  }

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
