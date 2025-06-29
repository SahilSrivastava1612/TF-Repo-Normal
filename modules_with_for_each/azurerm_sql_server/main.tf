resource "azurerm_ms_sql_server" "sql_serverblock1" {
    for_each = var.sql_servers
    name                         = each.value.name
    resource_group_name          = each.value.resource_group_name
    location                     = each.value.location
    version                      = each.value.version
    administrator_login          = data.azurerm_key_vault_secret.kvsecretblock.value
    administrator_login_password = data.azurerm_key_vault_secret.kvsecretblock2.value
}