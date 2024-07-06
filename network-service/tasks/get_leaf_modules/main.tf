terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm/config"
      version = "~> 0.4.0"
    }
  }
}

data "ipm_leaf_modules" "leaf_modules" {
  network_id = var.network_id
}

output "leaf_modules" {
  value = data.ipm_leaf_modules.leaf_modules
}


