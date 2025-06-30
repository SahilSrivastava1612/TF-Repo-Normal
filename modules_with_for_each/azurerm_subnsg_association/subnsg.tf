resource "azurerm_subnet_network_security_group_association" "subnsgblock1" {
    subnet_id = data.azurerm_subnet.datasubnetblock1.id
    network_security_group_id = data.azurerm_network_security_group.datansgblock1.id
}

resource "azurerm_subnet_network_security_group_association" "subnsgblock2" {
    subnet_id = data.azurerm_subnet.datasubnetblock2.id
    network_security_group_id = data.azurerm_network_security_group.datansgblock1.id
}