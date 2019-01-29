## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enable\_partitioning |  | string | `"true"` | no |
| location | (Required) The location where the resource group should be created. For a list of all Azure locations. | string | n/a | yes |
| resource\_group\_name | (Required) The name of the resource group. Must be unique on your Azure subscription. | string | n/a | yes |
| servicebus\_namespace | (Required) The name of the ServiceBus Namespace to create this topic in. Changing this forces a new resource to be created. | string | n/a | yes |
| servicebus\_queue |  | string | n/a | yes |
| sku |  | string | n/a | yes |
| tags |  | map | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| queue\_name |  |
| servicebus\_namespace |  |

