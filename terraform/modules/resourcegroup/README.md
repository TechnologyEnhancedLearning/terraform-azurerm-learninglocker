## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| location | (Required) The location where the resource group should be created. For a list of all Azure locations. | string | n/a | yes |
| name | (Required) The name of the resource group. Must be unique on your Azure subscription. | string | n/a | yes |
| tags | (Optional) A mapping of tags to assign to the resource. | map | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The resource group ID. |
| location | The location assigned in the resource group |
| name | The name of the resource group |

