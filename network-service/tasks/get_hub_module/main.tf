

data "ipm_hub_module" "hub_module" {
  network_id = var.network_id
}

output "hub_module" {
  value = data.ipm_hub_module.hub_module
}

