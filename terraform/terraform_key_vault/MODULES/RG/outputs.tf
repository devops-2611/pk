output "rg-det" {
    value = {
        rg_name = azurerm_resource_group.kv-rg.name
        com_loc = azurerm_resource_group.kv-rg.location
        com_tags = azurerm_resource_group.kv-rg.tags
    }
}