# output.tf

output "storage_account_name" {
  value       = azurerm_storage_account.storage-account.name
  description = "The Storage Account name."
}

output "static_website_url" {
  value = azurerm_cdn_endpoint.static-web-endpoint.origin
  description = "CDN Endpoint Url."
}
