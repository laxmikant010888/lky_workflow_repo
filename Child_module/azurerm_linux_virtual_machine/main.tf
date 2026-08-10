data "azurerm_network_interface" "nic" {

for_each = var.vm-child
  name              =  each.value.nic_name
  resource_group_name = each.value.resource_group_name

} 


# data "azurerm_key_vault" "kv" {
#   name                = "lkkeyvault"
#   resource_group_name = "lkryg"
# }


# data "azurerm_key_vault_secret" "vm_password" {
#   name         = "vm-pass"
#   key_vault_id = data.azurerm_key_vault.kv.id
# }


resource "azurerm_linux_virtual_machine" "vmss" {
  for_each = var.vm-child
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password =       each.value.admin_password                                       #data.azurerm_key_vault_secret.vm_password.value
  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]
   disable_password_authentication = each.value.disable_password_authentication
  


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}