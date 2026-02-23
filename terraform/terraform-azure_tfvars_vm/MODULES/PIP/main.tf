resource "azurerm_public_ip" "natpip" {
  name = var.varpip.name
  location = var.varpip.location
  resource_group_name =var.varpip.rg_name
  allocation_method = var.varpip.allocation_method
  sku = var.varpip.sku
}