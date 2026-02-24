resource "azurerm_subnet" "vzwsnetblc"{
  name = var.varsn.name
  virtual_network_name = var.varsn.vname
  resource_group_name = var.varsn.rg_name
  address_prefixes = var.varsn.add_pre
}