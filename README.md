# acr

This module manages the Azure Container Registry

## Requirements

| Name | Version |
|------|---------|
| azurerm | >=2.19.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >=2.19.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | location where the resource should be created | `string` | n/a | yes |
| resource_name | Azure Container Registry | `set(string)` | n/a | yes |
| acr | Azure Container Registry Arguments, defaults defined under local.default.acr | `any` | `{}` | no |
| tags | mapping of tags to assign, defaults defined under local.default.tags | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| container_registry | azurerm_container_registry results |
