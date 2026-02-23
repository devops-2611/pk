output "nat_det" {
    value = {
        id = azurerm_nat_gateway.vishalntbl.id
        resource_guid = azurerm_nat_gateway.vishalntbl.resource_guid
    }
}