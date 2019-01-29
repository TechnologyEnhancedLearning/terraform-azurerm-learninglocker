## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin\_password | The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure | string | `""` | no |
| admin\_username | The admin username of the VMSS that will be deployed | string | `"toor"` | no |
| automatic\_os\_upgrade |  | string | `"true"` | no |
| cloudconfig\_file | The location of the cloud init configuration file. | string | n/a | yes |
| computer\_name\_prefix | The prefix that will be used for the hostname of the instances part of the VM scale set | string | `"vmss"` | no |
| data\_disk\_size | Specify the size in GB of the data disk | string | `"10"` | no |
| health\_probe\_id |  | string | n/a | yes |
| ip\_configuration\_name |  | string | n/a | yes |
| load\_balancer\_backend\_address\_pool\_ids | The id of the backend address pools of the loadbalancer to which the VM scale set is attached | string | n/a | yes |
| location | The location where the resources will be created | string | `""` | no |
| managed\_disk\_type | Type of managed disk for the VMs that will be part of this compute group. Allowable values are 'Standard_LRS' or 'Premium_LRS'. | string | `"Standard_LRS"` | no |
| nb\_instance | Specify the number of vm instances | string | `"1"` | no |
| network\_profile | The name of the network profile that will be used in the VM scale set | string | `"np"` | no |
| network\_profile\_name |  | string | n/a | yes |
| resource\_group\_name | The name of the resource group in which the resources will be created | string | `""` | no |
| ssh\_key | Path to the public key to be used for ssh access to the VM | string | `"~/.ssh/id_rsa.pub"` | no |
| tags | A map of the tags to use on the resources that are deployed with this module. | map | n/a | yes |
| upgrade\_policy\_mode |  | string | `"Automatic"` | no |
| vm\_os\_id | The ID of the image that you want to deploy if you are using a custom image. | string | `""` | no |
| vm\_os\_offer | The name of the offer of the image that you want to deploy | string | `""` | no |
| vm\_os\_publisher | The name of the publisher of the image that you want to deploy | string | `""` | no |
| vm\_os\_simple | Specify Ubuntu or Windows to get the latest version of each os | string | `""` | no |
| vm\_os\_sku | The sku of the image that you want to deploy | string | `""` | no |
| vm\_os\_version | The version of the image that you want to deploy. | string | `"latest"` | no |
| vm\_size | Size of the Virtual Machine based on Azure sizing | string | `"Standard_A0"` | no |
| vmscaleset\_name | The name of the VM scale set that will be created in Azure | string | `"vmscaleset"` | no |
| vmss\_name |  | string | n/a | yes |
| vnet\_subnet\_id | The subnet id of the virtual network on which the vm scale set will be connected | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vmss\_id |  |

