terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }

  }
}

provider "ipm" {
  username = var.ipm_user
  password = var.ipm_password
  host     = var.ipm_host
}

data "ipm_hub_module" "hub_module" {
  network_id = var.network_id
}

output "hub_module" {
  value = data.ipm_hub_module.hub_module
}


