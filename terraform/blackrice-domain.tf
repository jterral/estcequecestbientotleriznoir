# blackrice-domain.tf

data "azurerm_dns_zone" "static-web-dnszone" {
  name                = "estcequecestbientotleriznoir.fr"
  resource_group_name = azurerm_resource_group.resource-group.name
}

resource "azurerm_dns_cname_record" "static-web-dnszone-record" {
  name                = "www"
  zone_name           = data.azurerm_dns_zone.static-web-dnszone.name
  resource_group_name = data.azurerm_dns_zone.static-web-dnszone.resource_group_name
  ttl                 = 3600
  target_resource_id  = azurerm_cdn_endpoint.static-web-endpoint.id
}

resource "azurerm_cdn_endpoint_custom_domain" "static-web-dnszone-cdomain" {
  name            = "blackrice-domain"
  cdn_endpoint_id = azurerm_cdn_endpoint.static-web-endpoint.id
  host_name       = "${azurerm_dns_cname_record.static-web-dnszone-record.name}.${data.azurerm_dns_zone.static-web-dnszone.name}"
}
