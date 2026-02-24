output "vnet_det" {
    value = {
        vnet_name = azurerm_virtual_network.vzwvnetblc.name
        vnet_id = azurerm_virtual_network.vzwvnetblc.id
    }
}