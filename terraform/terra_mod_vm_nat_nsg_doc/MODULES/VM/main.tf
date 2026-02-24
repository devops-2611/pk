resource "azurerm_linux_virtual_machine" "vishalvmbl" {
  name = var.varvm.name
  resource_group_name = var.varvm.rg_name
  location = var.varvm.loc
  size = var.varvm.size
  disable_password_authentication = false
  admin_username = var.varvm.uname
  admin_password = var.varvm.pass
  network_interface_ids = var.varvm.nic_id
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
    }

  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
}