output "primary_location" {
    value = azurerm_resource_group.rgtest1.location
    description = "Primary Location"
}

output "vnet_address_space" {
    value = azurerm_virtual_network.vnettest1.address_space
    description = "VNET Address Space"
}