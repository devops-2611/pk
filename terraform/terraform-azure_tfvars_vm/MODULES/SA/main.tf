resource "azurerm_storage_account" "sabl"{
  name = var.varsa.sa_name
  resource_group_name = var.varsa.rg_name
  location = var.varsa.sa_loc
  account_tier = var.varsa.account_tier
  account_replication_type = var.varsa.account_replication
  tags = var.varsa.tags
}