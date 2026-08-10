resource "azurerm_application_security_group" "asgs" {
    for_each = var.asg-child
  name                = each.value.asg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

}