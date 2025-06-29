data "azurerm_subnet" "datasubnetblock1" {
    resource_group_name = "rg-prod-000a1"
    name = "subnet-prod-frontend-1"
    virtual_network_name = "vnet-prod-000a1"
}

data "azurerm_subnet" "datasubnetblock2" {
    resource_group_name = "rg-prod-000a1"
    name = "subnet-prod-backend-1"
    virtual_network_name = "vnet-prod-000a1"
}

data "azurerm_network_security_group" "datansgblock1" {
    name = "todonsg1"
    resource_group_name = "rg-prod-000a1"
}