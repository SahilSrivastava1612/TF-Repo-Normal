resource "azurerm_key_vault" "kvblock1" {
    for_each = var.key_vaults
    name                = each.value.name
    resource_group_name = each.value.resource_group_name
    tenant_id           = data.azurerm_client_config.current.tenant_id
    location            = each.value.location
    sku_name            = each.value.sku_name

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id

        secret_permissions = [
            "Get",
            "List",
            "Set",
            "Delete",
            "Purge",
            "Recover",
        ]
    }
}