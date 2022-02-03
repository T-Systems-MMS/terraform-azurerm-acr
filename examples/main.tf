module "acr" {
  source = "../terraform-acr"
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
