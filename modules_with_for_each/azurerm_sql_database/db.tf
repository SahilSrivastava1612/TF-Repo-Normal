resource "azurerm_mssql_database" "sql_databaseblock" {
    for_each = var.sql_databases
    name = each.value.name
    server_id = data.azurerm_mssql_server.datasqlserverblock1.id
    sku_name = each.value.sku_name
}