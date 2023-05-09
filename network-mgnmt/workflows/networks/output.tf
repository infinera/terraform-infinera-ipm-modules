/*output "networks" {
  value = module.network.constellation_networks
}

output "network_leaf_modules" {
  value = module.leaf_module
}*/
 output "networks" {
  value = data.ipm_networks.networks
}