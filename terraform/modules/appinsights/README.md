## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| app\_insights\_name | (Required) Specifies the name of the Application Insights component. Changing this forces a new resource to be created. | string | n/a | yes |
| application\_type | (Required) Specifies the type of Application Insights to create. Valid values are Java, iOS, MobileCenter, Other, Phone, Store, Web and Node.JS. | string | n/a | yes |
| location | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | string | n/a | yes |
| resource\_group\_name | (Required) The name of the resource group in which to create the Application Insights component. | string | n/a | yes |
| tags | (Optional) A mapping of tags to assign to the resource. | map | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| app\_id |  |
| instrumentation\_key |  |

