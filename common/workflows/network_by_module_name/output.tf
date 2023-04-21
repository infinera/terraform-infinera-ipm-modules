output "constellation_networks" {
  value = module.network_only_by_module_name.constellation_networks
}

output "network_leaf_modules" {
  value = module.leaf_module_by_module_name
}