output "networks" {
  value = module.network_by_module_name.networks
}

output "leaf_modules" {
  value = module.network_by_module_name.leaf_modules
}
