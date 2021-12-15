variable "resource_name" {
  type        = set(string)
  description = "Azure Container Registry"
}
variable "location" {
  type        = string
  description = "location where the resource should be created"
}
variable "tags" {
  type        = any
  default     = {}
  description = "mapping of tags to assign, defaults defined under local.default.tags"
}
variable "acr" {
  type        = any
  default     = {}
  description = "Azure Container Registry Arguments, defaults defined under local.default.acr"
}

locals {
  default = {
    tags = {}
    acr = {
      sku           = "Basic"
      admin_enabled = true
    }
  }

  # merge default and custom variables
  tags = merge(local.default.tags, var.tags)
  acr  = merge(local.default.acr, var.acr)
}
