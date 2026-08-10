module "dev-rg" {
  source   = "../../Child_module/azurerm_resource_group"
  rg-child = var.rg-parent

}

module "dev-vnt" {
  source     = "../../Child_module/azurerm_virtual_network"
  vnet-child = var.vnet-parent
  depends_on = [module.dev-rg]
}

module "dev-snets" {
  source     = "../../Child_module/azurerm_subnet"
  snet-child = var.snet-parent
  depends_on = [module.dev-rg, module.dev-vnt]

}
module "dev-pip" {
  source     = "../../Child_module/azurerm_public_ip_address"
  pip-child  = var.pip-parent
  depends_on = [module.dev-rg]
}

module "dev-nics" {
  source     = "../../Child_module/azurerm_network_interface"
  nic-child  = var.nic-parent
  depends_on = [module.dev-rg, module.dev-vnt, module.dev-snets]

}

module "dev-vmss" {
  source     = "../../Child_module/azurerm_linux_virtual_machine"
  vm-child   = var.vms-parent
  depends_on = [module.dev-nics, module.dev-snets, module.dev-pip]
}

module "dev-nsgs" {
  source     = "../../Child_module/azurerm_network_security_group"
  nsg-child  = var.nsg-parent
  depends_on = [module.dev-rg]
}


module "prod-asg" {
  source     = "../../Child_module/azurerm_application_security_group"
  asg-child  = var.asg-parent
  depends_on = [module.dev-rg]

}

module "dev-strgs" {
  source                = "../../Child_module/azurerm_storage_account"
  storage-account-child = var.storage-account-parent
  depends_on            = [module.dev-rg]

}

module "dev-keyvaults" {
  source         = "../../Child_module/azurerm_key_vault"
  keyvault-child = var.keyvault-parent
  depends_on     = [module.dev-rg]

}

module "azureBastion" {
  source              = "../../Child_module/azurerm_AzureBastionSubnet"
  bastion_subnet_name = var.bastion-parent
  depends_on          = [module.dev-rg, module.dev-vnt]

}

module "dev-appgw-subnet" {
  source          = "../../Child_module/azurerm_app_gateway_subnet"
  child-appsubnet = var.parent-appsubnet
  depends_on      = [module.dev-rg, module.dev-vnt]

}

module "dev-appgw" {
  source          = "../../Child_module/azurerm_application_gateway"
  child-app_gateway = var.parent-appgw
  depends_on      = [module.dev-rg, module.dev-vnt, module.dev-appgw-subnet, module.dev-pip]

}