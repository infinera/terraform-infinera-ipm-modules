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

data "ipm_tc_endpoints" "tc_endpoints" {
  tc_id = var.tc_id
}

output "tcs" {
  value = data.ipm_tc_endpoints.tc_endpoints
}


