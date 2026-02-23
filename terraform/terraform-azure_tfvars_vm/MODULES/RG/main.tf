resource "azurerm_resource_group" "rgblc" {
    name = var.varrg.rg_name
    location = var.varrg.common_loc
    tags = var.varrg.common_tags
}