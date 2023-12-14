terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~>0.4.0"
    }
  }
}

data "ipm_transport_capacities" "tcs" {
}

locals {
  found-tc =[ for tc in ata.ipm_transport_capacities.tcs.transport_capacities : tc if tc.state.name == var.name]
}

output "found-tc" {
  value = length(local.found-tc) > 0 ? local.found-tc[0] : null
}

variable name {
  type = string
}