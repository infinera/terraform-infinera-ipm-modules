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

data "ipm_lcs" "lcs" {
  module_id = var.module_id
 col_id = var.col_id1
  module_id = var.module_id
 col_id = var.col_id2
  module_id = var.module_id
 col_id = var.col_id3
}

output "lcs" {
  value = data.ipm_lcs.lcs
}