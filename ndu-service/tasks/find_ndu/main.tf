terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }

  }
}

provider "ipm" {
  username = "xr-user-1"
  password = "infinera"
  host     = "ipm-eval2.westus3.cloudapp.azure.com"
}

data "ipm_ndus" "ndus" {
}

locals {
  found_ndu = [for ndu in data.ipm_ndus.ndus.ndus : ndu if ndu.state.name == var.name]
}

output "found_ndu" {
  value = length(local.found_ndu) > 0 ? found_ndu[0] : null
}

variable name {
  type = string
  default = "NDU-Kissimmee"
}

