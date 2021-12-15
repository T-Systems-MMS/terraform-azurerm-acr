# acr

This module manages the Azure Container Registry.

## Requirements

| Name | Version |
|------|---------|
| terraform | >=0.12 |
| azurerm | >=2.19.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >=2.19.0 |

## Resources

| Name | Type |
|------|------|
| azurerm_container_registry.acr | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | location where the resource should be created | `string` | n/a | yes |
| resource_name | Azure Container Registry | `set(string)` | n/a | yes |
| acr | Azure Container Registry Arguments, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| tags | mapping of tags to assign, default settings are defined within locals and merged with var settings | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| container_registry | azurerm_container_registry results |

## Examples

```hcl
module "acr" {
  source        = "../terraform-acr"
  location      = "westeurope"
  resource_name = ["servicecr"]
  acr           = {
    resource_group_name = "resource_group_name"
    key_vault_id        = "keyvault_id"
  }
  tags          = {
    service = "service_name"
  }
}
```
