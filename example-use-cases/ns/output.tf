/*output "constellation_networks" {
  value = module.network_by_module_name.constellation_networks
}

output "network_leaf_modules" {
  value = module.network_by_module_name.network_leaf_modules
}*/

output "networks" {
  value = local.networks
}
