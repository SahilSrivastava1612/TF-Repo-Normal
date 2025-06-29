resource "azurerm_resource_group" "rgblock1" {
    for_each = var.resource_groups
    name = each.key
    location = each.value
}