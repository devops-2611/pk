resource "azurerm_nat_gateway" "vishalntbl" {
  name = var.varnat.name
  location = var.varnat.loc
  resource_group_name =var.varnat.rg_name
  sku_name = var.varnat.sku
}

#Attach Public IP to NAT
resource "azurerm_nat_gateway_public_ip_association" "nat_assoc" {
  nat_gateway_id       = azurerm_nat_gateway.vishalntbl.id
  public_ip_address_id = var.varnat.pipid
}

#Attach NAT to Private Subnet

resource "azurerm_subnet_nat_gateway_association" "nat_subnet_assoc" {
  nat_gateway_id = azurerm_nat_gateway.vishalntbl.id
  subnet_id      = var.varnat.snet_id
}