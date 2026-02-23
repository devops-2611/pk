output "sa_det" {
    value = {
        sa_names = azurerm_storage_account.sabl.name
        sa_loc = azurerm_storage_account.sabl.location
        sa_id = azurerm_storage_account.sabl.id
    }
}