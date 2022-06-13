# output.tf

output "storage_account_name" {
  value       = azurerm_storage_account.storblackrice.name
  description = "The Storage Account name."
}
