output "container_registry" {
  description = "azurerm_container_registry"
  value = {
    for registry in keys(azurerm_container_registry.acr) :
    registry => {
      id = azurerm_container_registry.acr[registry].id
    }
  }
}
