# variable.tf

variable "site_id" {
  type        = string
  description = "id of the website"
}

variable "regions" {
  type = map(string)
  default = {
    "primary" = "westeurope"
    "cdn"     = "westeurope"
  }
}

variable "environment" {
  type    = string
  default = "prod"
}

variable "domain" {
  type    = string
  default = "estcequecestbientotleriznoir.fr"
}
