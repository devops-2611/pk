resource "azurerm_linux_virtual_machine" "vishalvmbl" {
  name = var.varvm.vm_name
  location = var.varvm.loc
  resource_group_name = var.varvm.rg_name
  size = var.varvm.vm_size
  network_interface_ids = var.varvm.nic_id
  admin_username = var.varvm.uname


  
    admin_ssh_key {
    username = var.varvm.uname
    # public_key = file("/home/sharma/.ssh/id_rsa.pub")
    public_key = file("${path.root}/id_rsa.pub")   
    }
  os_disk {
    caching = "ReadWrite"
    storage_account_type  = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
}