resource "azurerm_virtual_network" "vnblc" {
  name                = var.varvn.vnet_name
  address_space       = var.varvn.add_spa
  location            = var.varvn.loc
  resource_group_name = var.varvn.rg_name
  tags = var.varvn.common_tags
}
