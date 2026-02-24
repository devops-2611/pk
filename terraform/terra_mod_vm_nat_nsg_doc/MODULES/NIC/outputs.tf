output "nic_det" {
    value = {
        nic_id = azurerm_network_interface.nicbl.id
        nic_name = azurerm_network_interface.nicbl.name
}
}