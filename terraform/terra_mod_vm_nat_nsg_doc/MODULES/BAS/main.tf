# Create Azure Bastion Host
resource "azurerm_bastion_host" "bastion" {
  name = var.varbas.name
  location = var.varbas.loc
  resource_group_name = var.varbas.rg_name

  ip_configuration {
    name                 = var.varbas.ip_name
    subnet_id            = var.varbas.bas_snet_id
    public_ip_address_id = var.varbas.bas_pip_id
  }
}