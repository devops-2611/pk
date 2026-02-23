output "bastion" {
    value = {
        bas_id = azurerm_bastion_host.bastion.id
        bas_name = azurerm_bastion_host.bastion.name
}
}


