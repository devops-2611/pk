output "pip_det" {
    value = {
        ip_address = azurerm_public_ip.twopip.ip_address
        pip_id = azurerm_public_ip.twopip.id
        fqdn = azurerm_public_ip.twopip.fqdn
    }
}