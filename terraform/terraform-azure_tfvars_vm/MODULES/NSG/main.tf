# Create NSG

resource "azurerm_network_security_group" "vishalnsgbl" {
    name = var.varnsg.nsg_name
  location = var.varnsg.loc
  resource_group_name = var.varnsg.rg_name
  tags = var.varnsg.comm_tags
}
# Dynamic NSG Rules
resource "azurerm_network_security_rule" "vishalnsrule" {
    for_each = var.varnsg.rules
    name                       = each.key
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = each.value.source_port_range
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix
    resource_group_name         = var.varnsg.rg_name
    network_security_group_name = azurerm_network_security_group.vishalnsgbl.name
}
# nsg subnet associations
resource "azurerm_subnet_network_security_group_association" "assoc" {
  subnet_id                 = var.varnsg.subnet_id
  network_security_group_id = azurerm_network_security_group.vishalnsgbl.id
}