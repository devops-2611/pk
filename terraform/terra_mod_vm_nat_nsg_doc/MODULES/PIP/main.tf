resource "azurerm_public_ip" "twopip" {
  name = var.varpip.name
  location = var.varpip.loc
  resource_group_name = var.varpip.rg_name
  allocation_method = var.varpip.all_meth
  sku = var.varpip.sku

}