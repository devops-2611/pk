data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "kuber-kv" {
  name                       = var.varkv.name
  location                   = var.varkv.location
  resource_group_name        = var.varkv.rg-name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy" ]

    secret_permissions = ["Set", "Get", "Delete", "Purge", "Recover", "List"]
  }
}