## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| account\_replication\_type | The type of replication used for this storage account. | string | n/a | yes |
| account\_tier | The Tier of this storage account. | string | n/a | yes |
| address\_space | The address space that is used by the virtual network. | string | `"10.0.0.0/24"` | no |
| admin\_password | The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure | string | n/a | yes |
| admin\_username | The admin username of the VMSS that will be deployed | string | `"azureuser"` | no |
| app\_insights\_name | (Required) Specifies the name of the Application Insights component. Changing this forces a new resource to be created. | string | n/a | yes |
| application\_type | (Required) Specifies the type of Application Insights to create. Valid values are Java, iOS, MobileCenter, Other, Phone, Store, Web and Node.JS. | string | n/a | yes |
| automatic\_os\_upgrade | (Optional) Automatic OS patches can be applied by Azure to your scaleset. This is particularly useful when upgrade_policy_mode is set to Rolling. Defaults to false. | string | n/a | yes |
| bastion\_ip\_configuration\_name | (Required) An ip_configuration block as documented below. | string | n/a | yes |
| bastion\_name | Name of the prefix for the bastion name | string | n/a | yes |
| capacity | (Required) The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4. | string | n/a | yes |
| cloudconfig\_file | The location of the cloud init configuration file. | string | n/a | yes |
| computer\_name\_prefix | The prefix that will be used for the hostname of the instances part of the VM scale set | string | `"acidburn"` | no |
| enable\_non\_ssl\_port | (Optional) Enable the non-SSL port (6789) - disabled by default. | string | `"false"` | no |
| enable\_partitioning | (Optional) Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers. Changing this forces a new resource to be created. Defaults to false for Basic and Standard. For Premium, it MUST be set to true. | string | n/a | yes |
| family | (Required) The SKU family to use. Valid values are C and P, where C = Basic/Standard, P = Premium. | string | `"C"` | no |
| frontend\_name | (Required) Specifies the name of the frontend ip configuration. | string | n/a | yes |
| ip\_configuration\_name | (Required) An ip_configuration block as documented below. | string | n/a | yes |
| lb\_port | Protocols to be used for lb health probes and rules. [frontend_port, protocol, backend_port] | map | `<map>` | no |
| lb\_type | (Optional) Defined if the loadbalancer is private or public | string | `"public"` | no |
| location | (Required) The location where the resource group should be created. For a list of all Azure locations. | string | n/a | yes |
| nb\_instance | Number of default instances | string | `"1"` | no |
| network\_profile\_name | (Required) A collection of network profile block as documented below. | string | n/a | yes |
| prefix | (Required) Default prefix to use with your resource names. | string | `"azure_lb"` | no |
| redis\_name | (Required) The name of the Redis instance. Changing this forces a new resource to be created. | string | n/a | yes |
| remote\_port | Protocols to be used for remote vm access. [protocol, backend_port].  Frontend port will be automatically generated starting at 50000 and in the output. | map | `<map>` | no |
| resource\_group\_name | (Required) The name of the resource group. Must be unique on your Azure subscription. | string | n/a | yes |
| security\_group\_name | Network security group name | string | n/a | yes |
| servicebus\_namespace | (Required) Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created. | string | n/a | yes |
| servicebus\_queue | (Required) Specifies the name of the ServiceBus Queue resource. Changing this forces a new resource to be created. | string | n/a | yes |
| sku | (Required) Defines which tier to use. Options are basic, standard or premium. | string | n/a | yes |
| sku\_name | (Required) The SKU of Redis to use - can be either Basic, Standard or Premium. | string | n/a | yes |
| ssh\_key | Path to the public key to be used for ssh access to the VM | string | `"~/.ssh/id_rsa.pub"` | no |
| storage\_account\_name | (Required) Specifies the name of the Storage Account | string | n/a | yes |
| subnet\_names | A list of public subnets inside the vNet. | list | `<list>` | no |
| subnet\_prefixes | The address prefix to use for the subnet. | list | `<list>` | no |
| tags | The tags to associate with your infrastructure. | map | `<map>` | no |
| upgrade\_policy\_mode |  | string | n/a | yes |
| vm\_os\_simple | Simple lookup for server type | string | `"UbuntuServer"` | no |
| vm\_size | Size of the Virtual Machine based on Azure sizing | string | `"Standard_DS2_v2"` | no |
| vmss\_name | The name of the VM scale set that will be created in Azure | string | `"vmscaleset"` | no |
| vnet\_name | Name of the vnet to create | string | `"vnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| location | The location assigned in the resource group |

