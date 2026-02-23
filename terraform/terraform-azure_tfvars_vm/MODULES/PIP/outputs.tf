output "pip_det" {
    value = {
        pip_id = azurerm_public_ip.natpip.id
        ip_address = azurerm_public_ip.natpip.ip_address
        fqdn = azurerm_public_ip.natpip.fqdn # Fully qualified domain name
    }
}