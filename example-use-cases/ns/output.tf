/*output "constellation_networks" {
  value = module.network.constellation_networks
}

output "network_leaf_modules" {
  value = module.network.network_leaf_modules
}*/

output "networks" {
  value = local.networks
}
