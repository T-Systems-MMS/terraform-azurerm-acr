module "acr" {
  source        = "../terraform-acr"
  location      = "westeurope"
  resource_name = ["servicecr"]
  acr = {
    resource_group_name = "resource_group_name"
    key_vault_id        = "keyvault_id"
  }
  tags = {
    service = "service_name"
  }
}
