variable "acr" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    # resource definition
    acr = {
      name          = ""
      sku           = "Basic"
      admin_enabled = true
      tags          = {}
    }
  }

  # compare and merge custom and default values
  # merge all custom and default values
  acr = {
    for acr in keys(var.acr) :
    acr => merge(local.default.acr, var.acr[acr])
  }
}
