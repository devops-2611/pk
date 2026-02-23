output "rg_details" {
    value = {
        rg_name_out = azurerm_resource_group.rgblc.name
        comm_loc = azurerm_resource_group.rgblc.location
        comm_tag = azurerm_resource_group.rgblc.tags
    }
}