terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~>0.4.0"
    }
  }
}


data "ipm_hub_module" "hub_module" {
  network_id = var.network_id
}

output "hub_module" {
  value = data.ipm_hub_module.hub_module
}


