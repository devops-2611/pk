resource "azurerm_network_security_group" "vishalnsgbl" {
  name = var.varnsg.nsg_name
  location = var.varnsg.loc
  resource_group_name = var.varnsg.rg_name
  tags = var.varnsg.tgs
}

resource "azurerm_network_security_rule" "vishalnsrule" {
    for_each = var.varnsg.rules
  name = each.value.r_name
  priority = each.value.prio
  direction = each.value.dir
  access = each.value.acc
  protocol = each.value.prot
  source_port_range = each.value.spr
  destination_port_range = each.value.dpr
  source_address_prefix = each.value.sap
  destination_address_prefix = each.value.dap
  resource_group_name = var.varnsg.rg_name
  network_security_group_name = var.varnsg.nsg_name
}

resource "azurerm_subnet_network_security_group_association" "assoc" {
  subnet_id = var.varnsg.snet_id
  network_security_group_id = azurerm_network_security_group.vishalnsgbl.id
}