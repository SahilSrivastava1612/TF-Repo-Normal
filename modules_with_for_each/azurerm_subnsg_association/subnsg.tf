resource "azurerm_subnet_nsg_association" "subnsgblock1" {
    subnetid = data.azurerm_subnet.datasubnetblock1.id
    network_security_group_id = data.azurerm_network_security_group.datansgblock1.id
}

resource "azurerm_subnet_nsg_association" "subnsgblock2" {
    subnetid = data.azurerm_subnet.datasubnetblock2.id
    network_security_group_id = data.azurerm_network_security_group.datansgblock1.id
}