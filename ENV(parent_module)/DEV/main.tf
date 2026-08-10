module "dev-rg" {
  source   = "../../Child_module/RG"
  rg-child = var.rg-parent

}

module "dev-vnt" {
  source     = "../../Child_module/VNET"
  vnet-child = var.vnet-parent
  depends_on = [module.dev-rg]
}

module "dev-snets" {
  source     = "../../Child_module/Subnet"
  snet-child = var.snet-parent
  depends_on = [module.dev-rg, module.dev-vnt]

}
module "dev-pip" {
    source = "../../Child_module/PIP"
    pip-child = var.pip-parent
    depends_on = [ module.dev-rg ]
}

module "dev-nics" {
    source = "../../Child_module/NIC"
    nic-child = var.nic-parent
    depends_on = [ module.dev-rg, module.dev-vnt, module.dev-snets ]
  
}

module "dev-vmss" {
  source = "../../Child_module/VM"
  vm-child = var.vms-parent
  depends_on = [ module.dev-nics,module.dev-snets, module.dev-pip ]
}

module "dev-nsgs" {
  source = "../../Child_module/NSG"
  nsg-child = var.nsg-parent
  depends_on = [ module.dev-rg ]
}


module "prod-asg" {
  source = "../../Child_module/azurerm_application_security_group"
  asg-child = var.asg-parent
  depends_on = [ module.dev-rg]
  
}

module "dev-strgs" {
  source = "../../Child_module/azurerm_storage_account"
  storage-account-child = var.storage-account-parent
  depends_on = [ module.dev-rg]
  
}

module "dev-keyvaults" {
  source = "../../Child_module/azurerm_key_vault"
  keyvault-child = var.keyvault-parent
  depends_on = [ module.dev-rg]
  
}

