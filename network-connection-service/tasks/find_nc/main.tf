terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~>0.4.0"
    }
  }
}

data "ipm_network_connections" "ncs" {
}

locals {
  ncs = [for nc in data.ipm_network_connections.ncs.ncs : {
      id = nc.id
      href = nc.href
      service_mode = nc.state.service_mode
      end_points = { for endpoint in nc.end_points : endpoint.state.module_if.current_role => { id= endpoint.id, href = endpoint.href, name = endpoint.state.module_if.module_name, capacity = endpoint.state.capacity, client_if_aid = endpoint.state.module_if.client_if_aid} if endpoint.state.module_if != null }
  }]

  found_nc =[ for nc in local.ncs : nc if length(keys(nc.end_points)) > 0 ? (var.service_mode == "" ? true : nc.service_mode == var.service_mode) && nc.end_points["hub"].name == var.hub && (var.capacity == 0 ? true: nc.end_points["hub"].capacity == var.capacity) && nc.end_points["hub"].client_if_aid == var.hub_client_if_aid && nc.end_points["leaf"].name == var.leaf && (var.capacity == 0 ? true: nc.end_points["leaf"].capacity == var.capacity) && nc.end_points["leaf"].client_if_aid == var.leaf_client_if_aid : false]
}

output "found_nc" {
  value = length(local.found_nc) > 0 ? local.found_nc[0] : null
}


