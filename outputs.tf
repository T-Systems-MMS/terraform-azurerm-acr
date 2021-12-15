output "container_registry" {
  description = "azurerm_container_registry results"
  value = {
    for registry in keys(azurerm_container_registry.acr) :
    registry => {
      id   = azurerm_container_registry.acr[registry].id
      name = azurerm_container_registry.acr[registry].name
    }
  }
}
