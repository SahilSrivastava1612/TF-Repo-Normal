resource "azurerm_network_interface" "nicblock1" {
    
    name = "nic-vm1"
    location = "South Africa North"
    resource_group_name = "rg-prod-000a1"
    
    ip_configuration {
      name = "internal"
      subnet_id = data.azurerm_subnet.datasubnetblock1.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = data.azurerm_public_ip.datapip1.id
    }   
}

resource "azurerm_network_interface" "nicblock2" {
    name = "nic-vm1"
    location = "South Africa North"
    resource_group_name = "rg-prod-000a1"
    
    ip_configuration {
      name = "internal"
      subnet_id = data.azurerm_subnet.datasubnetblock2.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = data.azurerm_public_ip.datapip2.id
    }   
}

locals {
  vm_nic_map = {
    vm1 = azurerm_network_interface.nicblock1.id
    vm2 = azurerm_network_interface.nicblock2.id
  }
}

resource "azurerm_linux_virtual_machine" "linvmblocka" {
  for_each = var.vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size

  disable_password_authentication = "false"
  admin_username      = data.azurerm_key_vault_secret.datakvsecretblock1.value
  admin_password = data.azurerm_key_vault_secret.datakvsecretblock2.value
  

  network_interface_ids = [
    local.vm_nic_map[each.key]
  ]
  

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {   
    publisher = each.value.publisher #publisher ID from Azure Marketplace
    offer     = each.value.offer  # offer ID from Azure Marketplace
    sku       = each.value.sku  # SKU or plan ID from Azure Marketplace
    version   = each.value.version  # version of the image, e.g., "latest"  
  }
}