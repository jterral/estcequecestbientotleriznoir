# output.tf

output "storage_account_name" {
  value = module.website.storage_account_name
}

output "cdn_profile_name" {
  value = module.website.cdn_profile_name
}

output "cdn_endpoint_name" {
  value = module.website.cdn_endpoint_name
}
