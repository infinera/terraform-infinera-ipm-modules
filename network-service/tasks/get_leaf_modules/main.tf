terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~>0.4.0"
    }
  }
}

data "ipm_leaf_modules" "leaf_modules" {
  network_id = var.network_id
}

output "leaf_modules" {
  value = data.ipm_leaf_modules.leaf_modules
}


