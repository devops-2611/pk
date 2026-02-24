resource "azurerm_virtual_network" "vzwvnetblc"{
  name = var.varvnet.name
  resource_group_name = var.varvnet.rg_name  
  address_space = var.varvnet.add_spa
  location = var.varvnet.loc
  tags = var.varvnet.tg
}