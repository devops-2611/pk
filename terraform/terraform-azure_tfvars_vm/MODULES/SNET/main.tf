resource "azurerm_subnet" "snetbl" {
  name                 = var.varsn.snet_name
  resource_group_name  = var.varsn.rg_name
  virtual_network_name = var.varsn.vnet_name
  address_prefixes     = var.varsn.add_prefi
}