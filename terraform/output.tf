# output.tf

output "storage_account_name" {
  value       = azurerm_storage_account.stor.name
  description = "The Storage Account name."
}

output "static_website_url" {
  value       = azurerm_cdn_endpoint.cdne.origin
  description = "CDN Endpoint Url."
}
