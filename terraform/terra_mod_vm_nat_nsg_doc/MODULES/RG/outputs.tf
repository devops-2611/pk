output "rg_det" {
    value = {
        rg_name = azurerm_resource_group.vzwrgbl.name
        comm_loc = azurerm_resource_group.vzwrgbl.location
        comm_tag = azurerm_resource_group.vzwrgbl.tags
    }
}