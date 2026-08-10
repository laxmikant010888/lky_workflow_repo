resource "azurerm_subnet" "bastion_subnet" {
    for_each = var.bastion_subnet_name
    name = each.value.bastion_name
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
    address_prefixes = each.value.address_prefixes

    }