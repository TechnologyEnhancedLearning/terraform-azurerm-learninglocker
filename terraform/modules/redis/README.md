## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| capacity | (Required) The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4. | string | n/a | yes |
| enable\_non\_ssl\_port | (Optional) Enable the non-SSL port (6789) - disabled by default. | string | `"false"` | no |
| family | (Required) The SKU family to use. Valid values are C and P, where C = Basic/Standard, P = Premium. | string | `"C"` | no |
| location | (Required) The location of the resource group. | string | n/a | yes |
| redis\_name | (Required) The name of the Redis instance. Changing this forces a new resource to be created. | string | n/a | yes |
| resource\_group\_name | (Required) The name of the resource group in which to create the Redis instance. | string | n/a | yes |
| sku\_name | (Required) The SKU of Redis to use - can be either Basic, Standard or Premium. | string | n/a | yes |
| tags | (Optional) A mapping of tags to assign to the resource. | map | n/a | yes |

