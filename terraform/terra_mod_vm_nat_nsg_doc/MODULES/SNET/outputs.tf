output "sn_det" {
    value = {
        sn_name = azurerm_subnet.vzwsnetblc.name
        sn_id = azurerm_subnet.vzwsnetblc.id
    }
}