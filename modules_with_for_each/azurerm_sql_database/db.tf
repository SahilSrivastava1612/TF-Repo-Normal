resource "azurerm_ms_sql_database" "sql_databaseblock" {
    for_each = var.sql_databases
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    server_name = each.value.server_name
    sku_name = each.value.sku_name
}