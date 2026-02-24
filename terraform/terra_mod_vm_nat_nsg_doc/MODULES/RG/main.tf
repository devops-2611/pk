resource "azurerm_resource_group" "vzwrgbl" {
    name = var.varrg.rg_name
    location = var.varrg.location
    tags = var.varrg.tags
}