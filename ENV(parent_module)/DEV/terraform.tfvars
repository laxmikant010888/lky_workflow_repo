rg-parent = {

  rg1 = {
    rg_name     = "dev-rg"
    rg_location = "centralindia"
  }
}


vnet-parent = {
  vnet1 = {
    vnet_name           = "dev-vnet"
    location            = "centralindia"
    resource_group_name = "dev-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

snet-parent = {
  subnet1 = {
    name                 = "dev-frontend_subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.0.0/24"]
  }

  subnet2 = {
    name                 = "dev-backend_subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.1.0/24"]

  }


}

pip-parent = {
  pip1 = {
    name                = "dev-frontend_pip"
    resource_group_name = "dev-rg"
    location            = "centralindia"
    allocation_method   = "Static"

  }
  pip2 = {
    name                = "dev-backend_pip"
    resource_group_name = "dev-rg"
    location            = "centralindia"
    allocation_method   = "Static"

  }

}

nic-parent = {
  nic1 = {
    nic_name                      = "dev-frontend-nic"
    location                      = "centralindia"
    resource_group_name           = "dev-rg"
    pip_name                      = "internal"
    subnet_name                   = "dev-frontend_subnet"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "dev-vnet"
  }


  nic2 = {

    nic_name                      = "dev-backend-nic"
    location                      = "centralindia"
    resource_group_name           = "dev-rg"
    pip_name                      = "internal"
    subnet_name                   = "dev-backend_subnet"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "dev-vnet"

  }

}

vms-parent = {
  vm1 = {
    vm_name                         = "dev-frontend-vm"
    resource_group_name             = "dev-rg"
    location                        = "centralindia"
    size                            = "Standard_D2_v5"
    admin_username                  = "adminuser"
    admin_password                  = "AdminPassword123!"
    disable_password_authentication = false
    nic_name                        = "dev-frontend-nic"


  }

  vm2 = {
    vm_name                         = "dev-backend-vm"
    resource_group_name             = "dev-rg"
    location                        = "centralindia"
    size                            = "Standard_D2_v5"
    admin_username                  = "adminuser"
    admin_password                  = "AdminPassword123!"
    disable_password_authentication = false
    nic_name                        = "dev-backend-nic"

  }


}

nsg-parent = {
  nsg1 = {
    nsg_name            = "dev-frontend-nsg"
    location            = "centralindia"
    resource_group_name = "dev-rg"
  }

  nsg2 = {
    nsg_name            = "dev-backend-nsg"
    location            = "centralindia"
    resource_group_name = "dev-rg"
  }
}

asg-parent = {
  asg1 = {
    asg_name            = "dev-frontend-asg"
    location            = "centralindia"
    resource_group_name = "dev-rg"
  }

  asg2 = {
    asg_name            = "dev-backend-asg"
    location            = "centralindia"
    resource_group_name = "dev-rg"
  }
}

storage-account-parent = {
  storage1 = {
    name                     = "devstorageaccountlkst"
    resource_group_name      = "dev-rg"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }

}

keyvault-parent = {
  keyvault1 = {
    keyvault_name            = "dev-lkytkeyvault"
    resource_group_name      = "dev-rg"
    location                 = "centralindia"
    sku_name                 = "standard"
    tenant_id                = "70215518-e920-4fbb-bce9-8e471101e454"
    purge_protection_enabled = false
  }
}

bastion-parent = {
  bastion1 = {
    bastion_name         = "AzureBastionSubnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

parent-appsubnet = {

  subnet1 = {
    name                 = "dev-app-subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.3.0/24"]

  }
}


parent-appgw = {
  appgw1 = {
    name                = "dev-app-gateway"
    resource_group_name = "dev-rg"
    location            = "centralindia"
    sku_name            = "Standard_v2"
    sku_tier            = "Standard_v2"
    capacity            = 2
    pip_name = "dev-frontend_pip"
    subnet_name = "dev-app-subnet"
    virtual_network_name = "dev-vnet"
  }
}

