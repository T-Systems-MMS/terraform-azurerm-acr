module "acr" {
  source  = "registry.terraform.io/T-Systems-MMS/acr/azurerm"
  version = "1.0.0"
  container_registry = {
    crmms = {
      location            = "westeurope"
      resource_group_name = "rg-mms-github"
    }
  }
}
