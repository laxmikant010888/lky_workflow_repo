data "azurerm_subnet" "appgw_subnet" {
  for_each = var.child-app_gateway
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "appgw_pip" {
  for_each = var.child-app_gateway
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_application_gateway" "appgw" {
  for_each = var.child-app_gateway
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  gateway_ip_configuration {
    name      = "appgw-ip-config"
    subnet_id = data.azurerm_subnet.appgw_subnet[each.key].id
  }

    frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = data.azurerm_public_ip.appgw_pip[each.key].id
  }

    sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    capacity = each.value.capacity
  }

  frontend_port {
    name = "http-port"
    port = 80
  }



  backend_address_pool {
    name = "backend-pool"
  }

  backend_http_settings {
    name                  = "backend-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "http-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "basic-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "backend-http-settings"
    priority                   = 100
  }
}