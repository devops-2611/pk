output "snet_det" {
    value = {
        snet_name = azurerm_subnet.snetbl.name
        snet_id = azurerm_subnet.snetbl.id
    }
}