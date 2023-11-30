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

data "ipm_reachable_modules" "reachable_modules" {
  network_id = var.network_id
}

output "reachable_modules" {
  value = data.ipm_reachable_modules.reachable_modules
}


