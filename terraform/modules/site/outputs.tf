# output.tf

output "storage_account_name" {
  value = azurerm_storage_account.stor.name
}

output "cdn_profile_name" {
  value = azurerm_cdn_profile.cdnp.name
}

output "cdn_endpoint_name" {
  value = azurerm_cdn_endpoint.cdne.name
}
