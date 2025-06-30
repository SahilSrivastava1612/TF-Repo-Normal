module "azurerm_resource_group" {
  source          = "../modules_with_for_each/azurerm_resource_group"
  resource_groups = var.resource_group
}

module "azurerm_key_vault" {
  depends_on = [module.azurerm_resource_group]
  source     = "../modules_with_for_each/azurerm_key_vaults"
  key_vaults = var.key_vault
}

module "azurerm_vnet" {
  depends_on = [module.azurerm_resource_group]
  source     = "../modules_with_for_each/azurerm_virtualnetwork"
  vnets      = var.vnet
}

module "azurerm_subnet" {
  depends_on = [module.azurerm_vnet]
  source     = "../modules_with_for_each/azurerm_subnets"
  subnets    = var.subnet
}

module "azurerm_ms_sql_server" {
  depends_on  = [module.azurerm_key_vault, module.azurerm_resource_group]
  source      = "../modules_with_for_each/azurerm_sql_server"
  sql_servers = var.sql_server
}

module "azurerm_sql_server_database" {
  depends_on    = [module.azurerm_resource_group, module.azurerm_ms_sql_server]
  source        = "../modules_with_for_each/azurerm_sql_database"
  sql_databases = var.sql_server_database
}

module "azurerm_nsg" {
  depends_on = [module.azurerm_subnet, module.azurerm_resource_group]
  source     = "../modules_with_for_each/azurerm_nsg"
}

module "azurerm_subnet_nsg_asso" {
  depends_on = [module.azurerm_resource_group, module.azurerm_nsg, module.azurerm_subnet, module.azurerm_vnet]
  source     = "../modules_with_for_each/azurerm_subnsg_association"
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group]
  source     = "../modules_with_for_each/azurerm_public_ips"
  pips       = var.pip
}

module "azurerm_virtual_machine" {
  depends_on = [module.azurerm_key_vault, module.azurerm_nsg, module.azurerm_public_ip, module.azurerm_resource_group, module.azurerm_subnet, module.azurerm_vnet]
  source     = "../modules_with_for_each/azurerm_virtual_machines"
  vms        = var.vm
}