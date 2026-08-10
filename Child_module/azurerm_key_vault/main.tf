

resource "azurerm_key_vault" "keyvaults" {
  for_each = var.keyvault-child
  name                = each.value.keyvault_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku_name = each.value.sku_name

  tenant_id = each.value.tenant_id

  #soft_delete_enabled = false
  purge_protection_enabled = each.value.purge_protection_enabled
}