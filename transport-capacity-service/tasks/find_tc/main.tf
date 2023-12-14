

data "ipm_transport_capacities" "tcs" {
}


locals {
  tcs = [for tc in data.ipm_transport_capacities.tcs.transport_capacities : {
      id = tc.id
      href = tc.href
      name = tc.state.name
      capacity_mode = tc.state.capacity_mode
      end_points = { for endpoint in tc.end_points : endpoint.state.module_if.current_role => { id = endpoint.id, href = endpoint.href, name = endpoint.state.module_if.module_name, capacity = endpoint.state.capacity, client_if_aid = endpoint.state.module_if.client_if_aid} if endpoint.state.module_if != null }
  }]

  found-tc =[ for tc in local.tcs : tc if length(keys(tc.end_points)) > 0 ? ((var.var.capacity_mode == "" ? true : tc.capacity_mode == var.capacity_mode) && tc.end_points["hub"].name == var.hub && (var.var.capacity == 0 ? true : tc.end_points["hub"].capacity == var.capacity) && tc.end_points["hub"].client_if_aid == var.hub_client_if_aid && tc.end_points["leaf"].name == var.leaf && (var.var.capacity == 0 ? true : tc.end_points["leaf"].capacity == var.capacity) && tc.end_points["leaf"].client_if_aid == var.leaf_client_if_aid) : false]
}

output "found-tc" {
  value = length(local.found-tc) > 0 ? local.found-tc[0] : null
}