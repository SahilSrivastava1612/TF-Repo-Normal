data "azurerm_key_vault" "kvblock" {
  name                = "kv-prod-000a1"
  resource_group_name = "rg-prod-000a1"
}

data "azurerm_key_vault_secret" "kvsecretblock" {
name = "server-admin"
key_vault_id = data.azurerm_key_vault.kvblock.id
}

data "azurerm_key_vault_secret" "kvsecretblock2" {
name = "server-password"
key_vault_id = data.azurerm_key_vault.kvblock.id
}