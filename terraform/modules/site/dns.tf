# dns.tf

resource "azurerm_dns_zone" "dns" {
  name                = var.domain
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.tags
}

resource "azurerm_dns_cname_record" "www_cname" {
  name                = "www"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 3600
  target_resource_id  = azurerm_cdn_endpoint.cdne.id
  tags                = local.tags
}
