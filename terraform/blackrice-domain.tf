# blackrice-domain.tf

data "azurerm_dns_zone" "static_web_dnszone" {
  name                = "www.estcequecestbientotleriznoir.fr"
  resource_group_name = azurerm_resource_group.resource-group.name
}

resource "azurerm_dns_cname_record" "static_web_dnszone_record" {
  name                = "static-web-domain_cname_record"
  zone_name           = data.azurerm_dns_zone.static_web_dnszone.name
  resource_group_name = data.azurerm_dns_zone.static_web_dnszone.resource_group_name
  ttl                 = 3600
  target_resource_id  = azurerm_cdn_endpoint.static-web-endpoint.id
}

resource "azurerm_cdn_endpoint_custom_domain" "static_web_dnszone_cdomain" {
  name            = "static_web_dnszone_cdomain"
  cdn_endpoint_id = azurerm_cdn_endpoint.static-web-endpoint.id
  host_name       = "${azurerm_dns_cname_record.static_web_dnszone_record.name}.${data.azurerm_dns_zone.static_web_dnszone.name}"
}
