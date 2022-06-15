# locals.tf

locals {
  tags = {
    "environment"  = var.environment
    "organization" = "jootl"
    "product"      = "blackrice"
  }
}
