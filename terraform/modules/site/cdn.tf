# cdn.tf

resource "azurerm_cdn_profile" "cdnp" {
  name                = "cdnp-${var.site_id}"
  location            = var.regions["cdn"]
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard_Microsoft"
  tags                = local.tags
}

resource "azurerm_cdn_endpoint" "cdne" {
  name                = "cdne-${var.site_id}"
  profile_name        = azurerm_cdn_profile.cdnp.name
  location            = azurerm_cdn_profile.cdnp.location
  resource_group_name = azurerm_resource_group.rg.name
  origin_host_header  = azurerm_storage_account.stor.primary_web_host

  origin {
    name      = "${var.site_id}web"
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

resource "azurerm_cdn_endpoint_custom_domain" "custom_domain" {
  name            = "cdomain-${var.site_id}"
  cdn_endpoint_id = azurerm_cdn_endpoint.cdne.id
  host_name       = "${azurerm_dns_cname_record.www_cname.name}.${azurerm_dns_zone.dns.name}"
}
