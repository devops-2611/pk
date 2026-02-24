output "nsg_details" {
  value = {
    nsg_id   = azurerm_network_security_group.vishalnsgbl.id
    nsg_name = azurerm_network_security_group.vishalnsgbl.name
  }
}