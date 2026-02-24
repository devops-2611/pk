resource "azurerm_network_interface" "nicbl" {
  name                = var.varnic.name
  location            = var.varnic.loc
  resource_group_name = var.varnic.rg_name

  ip_configuration {
    name                          = var.varnic.ip_name
    subnet_id                     = var.varnic.nic_snet_id
    private_ip_address_allocation = var.varnic.nic_prip_id
    # public_ip_address_id          = var.var.nic_pip_id
  }
}
