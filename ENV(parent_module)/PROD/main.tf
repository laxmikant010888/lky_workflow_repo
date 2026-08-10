module "prod-rg" {
  source   = "../../Child_module/azurerm_resource_group"
  rg-child = var.rg-parent

}

module "prod-vnt" {
  source     = "../../Child_module/azurerm_virtual_network"
  vnet-child = var.vnet-parent
  depends_on = [module.prod-rg]
}

module "prod-snets" {
  source     = "../../Child_module/azurerm_subnet"
  snet-child = var.snet-parent
  depends_on = [module.prod-rg, module.prod-vnt]

}
module "prod-pip" {
    source = "../../Child_module/azurerm_public_ip_address"
    pip-child = var.pip-parent
    depends_on = [ module.prod-rg ]
}

module "prod-nics" {
    source = "../../Child_module/azurerm_network_interface"
    nic-child = var.nic-parent
    depends_on = [ module.prod-rg, module.prod-vnt, module.prod-snets ]
  
}

module "prod-vms" {
  source = "../../Child_module/azurerm_virtual_machine"
  vm-child = var.vms-parent
  depends_on = [ module.prod-nics,module.prod-snets, module.prod-pip ]
}

module "prod-nsg" {
  source = "../../Child_module/azurerm_network_security_group"
  nsg-child = var.nsg-parent
  depends_on = [ module.prod-rg ]
  
}

module "prod-asg" {
  source = "../../Child_module/azurerm_application_security_group"
  asg-child = var.asg-parent
  depends_on = [ module.prod-rg ]
  
}

module "prod-strgs" {
  source = "../../Child_module/azurerm_storage_account"
  storage-account-child = var.storage-account-parent
  depends_on = [ module.prod-rg]
  
}

module "prod-keyvaults" {
  source = "../../Child_module/azurerm_key_vault"
  keyvault-child = var.keyvault-parent
  depends_on = [ module.prod-rg]
  
}



