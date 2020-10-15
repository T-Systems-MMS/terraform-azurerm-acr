# resource definition
variable "resource_name" {
  type    = set(string)
  default = ["acr"]
}
variable "location" {
  type = string
}
variable "tags" {
  type    = any
  default = {}
}
variable "acr" {
  type    = any
  default = {}
}

locals {
  # type constraints

  # default values
  default = {
    # resource definition
    tags = {}
    acr = {
      sku           = "Basic"
      admin_enabled = true
    }
  }

  # merge custom and default values
  tags = merge(local.default.tags, var.tags)
  acr  = merge(local.default.acr, var.acr)
}
