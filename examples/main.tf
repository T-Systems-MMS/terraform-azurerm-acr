module "acr" {
  source = "registry.terraform.io/T-Systems-MMS/acr/azurerm"
  acr = {
    servicecr = {
      location            = "westeurope"
      resource_group_name = "service-rg"
      key_vault_id        = "keyvault_id"
      tags = {
        service = "service_name"
      }
    }
  }
}
