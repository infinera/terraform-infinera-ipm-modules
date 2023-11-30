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
  host     = "ipm-eval4.westus3.cloudapp.azure.com"
}

data "ipm_transport_capacities" "tcs" {
}

locals {
  found-tc =[ for tc in local.tcs : tc if tc.state.name == var.name]
}

output "found-tc" {
  value = length(local.found-tc) > 0 ? local.found-tc[0] : null
}

variable name {
  type = string
}