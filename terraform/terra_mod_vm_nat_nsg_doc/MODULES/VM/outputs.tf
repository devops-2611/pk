output "vm_det" {
  value = {
    vm_id                = azurerm_linux_virtual_machine.vishalvmbl.id
    virtual_machine_id   = azurerm_linux_virtual_machine.vishalvmbl.virtual_machine_id
    private_ip_addresses = azurerm_linux_virtual_machine.vishalvmbl.private_ip_addresses
    public_ip_address    = azurerm_linux_virtual_machine.vishalvmbl.public_ip_address
    os_id                = azurerm_linux_virtual_machine.vishalvmbl.os_disk[0].id
  }
}