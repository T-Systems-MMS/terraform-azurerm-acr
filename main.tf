/**
 * # acr
 *
 * This module manages the Azure Container Registry
*/

resource "azurerm_container_registry" "acr" {
  for_each = var.resource_name

  name                = each.value
  location            = var.location
  resource_group_name = local.acr.resource_group_name
  sku                 = local.acr.sku
  admin_enabled       = local.acr.admin_enabled

  tags = {
    for tag in keys(local.tags) :
    tag => local.tags[tag]
  }

  lifecycle {
    prevent_destroy = true
  }
}
