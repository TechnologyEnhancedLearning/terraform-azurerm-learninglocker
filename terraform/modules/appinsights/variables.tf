variable "app_insights_name" {
  description = "(Required) Specifies the name of the Application Insights component. Changing this forces a new resource to be created."
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Application Insights component."
}

variable "application_type" {
  description = "(Required) Specifies the type of Application Insights to create. Valid values are Java, iOS, MobileCenter, Other, Phone, Store, Web and Node.JS."
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = "map"
}
