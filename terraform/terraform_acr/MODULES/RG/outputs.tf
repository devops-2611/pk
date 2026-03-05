output "rg_det" {
    value= {
        rg_name = azurerm_resource_group.rgblc.name
        com_loc = azurerm_resource_group.rgblc.location
        com_tags = azurerm_resource_group.rgblc.tags
    }
}