rg-parent = {

  rg1 = {
    rg_name     = "prod-rg"
    rg_location = "centralindia"
  }
}


vnet-parent = {
  vnet1 = {
    vnet_name           = "prod-vnet"
    location            = "centralindia"
    resource_group_name = "prod-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

snet-parent = {
  subnet1 = {
    name                 = "prod-frontend_subnet"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["10.0.0.0/24"]
  }

  subnet2 = {
    name                 = "prod-backend_subnet"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["10.0.1.0/24"]

  }
}

pip-parent = {
    pip1 = {
  name                = "prod-frontend_pip"
  resource_group_name = "prod-rg"
  location            = "centralindia"
  allocation_method   = "Static"

    }
    pip2 = {
  name                = "prod-backend_pip"
  resource_group_name = "prod-rg"
  location            = "centralindia"
  allocation_method   = "Static"

    }

}

nic-parent = {
    nic1 = {
    nic_name                = "prod-frontend-nic"
    location            = "centralindia"
    resource_group_name = "prod-rg"
    pip_name            = "internal"
    subnet_name = "prod-frontend_subnet" 
    private_ip_address_allocation = "Dynamic"
     virtual_network_name = "prod-vnet"
  }
    

nic2 = {
   
  nic_name                = "prod-backend-nic"
  location            = "centralindia"
  resource_group_name = "prod-rg"
  pip_name                         = "internal"
  subnet_name = "prod-backend_subnet" 
  private_ip_address_allocation = "Dynamic"
   virtual_network_name = "prod-vnet"

}

}

vms-parent = {
  vm1 = {
  vm_name                = "prod-frontend-vm"
  resource_group_name = "prod-rg"
  location            = "centralindia"
  size                = "Standard_D2_v5"
  admin_username      = "adminuser"
  #admin_password      = 
  disable_password_authentication = false
   nic_name                = "prod-frontend-nic"


  }

  vm2 = {
  vm_name                = "prod-backend-vm"
  resource_group_name = "prod-rg"
  location            = "centralindia"
  size                = "Standard_D2_v5"
  admin_username      = "adminuser"
  #admin_password      = 
  disable_password_authentication = false
  nic_name                = "prod-backend-nic"

  }

}

nsg-parent = {
  nsg1 = {
    nsg_name             = "prod-frontend-nsg"
    location              = "centralindia"
    resource_group_name   = "prod-rg"
  }

  nsg2 = {
    nsg_name             = "prod-backend-nsg"
    location              = "centralindia"
    resource_group_name   = "prod-rg"
  }
}


asg-parent = {
  asg1 = {
    asg_name             = "prod-frontend-asg"
    location              = "centralindia"
    resource_group_name   = "prod-rg"
  }

  asg2 = {
    asg_name             = "prod-backend-asg"
    location              = "centralindia"
    resource_group_name   = "prod-rg"
  }
}

storage-account-parent = {
  storage1 = {
    name                     = "prodstorageaccount"
    resource_group_name      = "prod-rg"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }

}

# keyvault-parent = {
#   keyvault1 = {
#     name                     = "prod-keyvault"
#     resource_group_name      = "prod-rg"
#     location                 = "centralindia"
#     sku_name                 = "standard"
#     tenant_id                = "f0b91e77-da63-4c8a-a721-36926ed974e4"
#   }
# }





