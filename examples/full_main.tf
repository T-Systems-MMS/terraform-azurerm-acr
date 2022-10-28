module "acr" {
  source  = "registry.terraform.io/T-Systems-MMS/acr/azurerm"
  version = "1.0.0"
  container_registry = {
    crmms = {
      location                      = "westeurope"
      resource_group_name           = "rg-mms-github"
      sku                           = "Premium"
      admin_enabled                 = true
      public_network_access_enabled = true
      network_rule_set = {
        ip_rule = {
          proxy = {
            ip_range = "192.0.0.1/32"
          }
        }
      }
      tags = {
        project     = "mms-github"
        environment = terraform.workspace
        managed-by  = "terraform"
      }
    }
  }
}
