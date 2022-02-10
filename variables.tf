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
      public_network_access_enabled = true
      quarantine_policy_enabled = false
      zone_redundancy_enabled = false
      network_rule_bypass_option = "AzureServices"
      anonymous_pull_enabled = false
      data_endpoint_enabled         = false
      retention_policy = {
        days = 7
        enabled = false
      }
      trust_policy = {
        enabled = false
      }
      tags          = {}
    }
  }

  # compare and merge custom and default values
  acr_values = {
    for acr in keys(var.acr) :
    acr => merge(local.default.acr, var.acr[acr])
  }
  # merge all custom and default values
  acr = {
    for acr in keys(var.acr) :
    acr => merge(
      local.acr_values[acr],
      {
        for config in ["retention_policy","trust_policy"] :
        config => merge(local.default.acr[config], local.acr_values[acr][config])
      }
    )
  }
}
