## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| account\_replication\_type | The type of replication used for this storage account. | string | n/a | yes |
| account\_tier | The Tier of this storage account. | string | n/a | yes |
| location | The Azure location where the Storage Account exists | string | n/a | yes |
| resource\_group\_name | (Required) Specifies the name of the resource group the Storage Account is located in. | string | n/a | yes |
| storage\_account\_name | (Required) Specifies the name of the Storage Account | string | n/a | yes |
| tags | (Optional) A mapping of tags to assign to the resource. | map | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| storage\_account\_id |  |

