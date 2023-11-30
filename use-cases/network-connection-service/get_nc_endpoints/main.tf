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

data "ipm_nc_endpoints" "endpoints" {
  nc_id = var.nc_id
}

output "acs" {
  value = data.ipm_nc_endpoints.endpoints
}
