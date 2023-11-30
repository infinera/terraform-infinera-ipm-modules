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

data "ipm_leaf_modules" "leaf_modules" {
  network_id = var.network_id
}

output "leaf_modules" {
  value = data.ipm_leaf_modules.leaf_modules
}


