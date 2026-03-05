resource "azurerm_resource_group" "rgblc" {
  name = var.varrg.name
  location = var.varrg.location
  tags = var.varrg.tags
}