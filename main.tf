/**
 * # acr
 *
 * This module manages the Azure Container Registry.
 *
*/

resource "azurerm_container_registry" "acr" {
  for_each = var.acr

  name                          = local.acr[each.key].name == "" ? each.key : local.acr[each.key].name
  location                      = local.acr[each.key].location
  resource_group_name           = local.acr[each.key].resource_group_name
  sku                           = local.acr[each.key].sku
  admin_enabled                 = local.acr[each.key].admin_enabled
  public_network_access_enabled = local.acr[each.key].public_network_access_enabled

  retention_policy {
    days    = local.acr[each.key].retention_policy.days
    enabled = local.acr[each.key].retention_policy.enabled
  }
  trust_policy {
    enabled = local.acr[each.key].trust_policy.enabled
  }

  tags = local.acr[each.key].tags

  lifecycle {
    prevent_destroy = true
  }
}
