output "vn_det" {
    value = {
        vn_id = azurerm_virtual_network.vnblc.id
        vn_name = azurerm_virtual_network.vnblc.name
    }
}