
data "azurerm_subnet" "subnet" {

  for_each = var.nic-child

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name

}

resource "azurerm_network_interface" "nics" {
    for_each = var.nic-child
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  
 ip_configuration {
 name = each.value.pip_name
 subnet_id = data.azurerm_subnet.subnet[each.key].id
  private_ip_address_allocation = each.value.private_ip_address_allocation
 } 

  
}


