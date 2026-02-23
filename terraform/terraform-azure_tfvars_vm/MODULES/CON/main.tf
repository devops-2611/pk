resource "azurerm_storage_container" "contblc" {
  name                  = var.varcon.con_name
  storage_account_id    = var.varcon.sa_id
  container_access_type = var.varcon.container_access_type
}