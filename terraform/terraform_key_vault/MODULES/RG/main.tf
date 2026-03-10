resource "azurerm_resource_group" "kv-rg" {
  name = var.varrg.name
  location = var.varrg.location
  tags = var.varrg.tags

}
