
data "ipm_networks" "networks" {
  id = var.id
}

output "networks" {
  value = data.ipm_networks.networks
}


