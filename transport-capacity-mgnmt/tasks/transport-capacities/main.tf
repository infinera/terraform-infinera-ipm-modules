terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

// Constellation Network Resource supports CRUD functions
resource "ipm_transport_capacity" "transport_capacities" {
  for_each = { for tc in var.transport-capacities : tc.name => tc }
  config = {
    name = each.value.name
    capacity_mode = each.value.capacity_mode != null ? each.value.capacity_mode: each.value.profile != null ? var.tc_profiles[each.value.profile].capacity_mode : null
    labels = each.value.labels != null ? each.value.labels : each.value.profile != null ? var.tc_profiles[each.value.profile].labels :null
  }
  end_points = [ for endpoint in each.value.endpoints : 
              {
                config = {
                  selector = endpoint.identifier.id == null ? (endpoint.identifier.name == null ? (endpoint.identifier.mac_address == null ? (endpoint.identifier.serial_number == null ? (endpoint.identifier.host_name == null ? (endpoint.identifier.host_port_id == null ? (endpoint.identifier.host_sys_name == null ? (endpoint.identifier.host_port_source_mac == null ? null : { host_port_selector_by_port_source_mac = { port_source_mac = endpoint.identifier.port_source_mac } }) : { host_port_selector_by_sys_name = { sys_name = endpoint.identifier.host_sys_name, port_id = endpoint.identifier.host_port_id, port_id_subtype = endpoint.identifier.host_port_id_subtype } }) : { host_port_selector_by_port_id = { chassis_id = endpoint.identifier.host_chassis_id, chassis_id_subtype = endpoint.identifier.host_chassis_id_subtype, port_id = endpoint.identifier.host_port_id, port_id_subtype = endpoint.identifier.host_port_id_subtype } }) : { host_port_selector_by_name = { host_name = endpoint.identifier.host_name, host_port_name = endpoint.identifier.host_port_name } }) : { module_if_selector_by_module_serial_number = { module_serial_number = endpoint.identifier.serial_number, module_client_if_aid = endpoint.identifier.module_client_if_aid} }) : { module_if_selector_by_module_mac = { module_mac = endpoint.identifier.mac_address, module_client_if_aid = endpoint.identifier.module_client_if_aid } }) : { module_if_selector_by_module_name = { module_name = endpoint.identifier.name, module_client_if_aid = endpoint.identifier.module_client_if_aid } }) : { module_if_selector_by_module_id = { module_id = endpoint.identifier.id, module_client_if_aid = endpoint.identifier.module_client_if_aid }
                  }
                  capacity = endpoint.capacity != null ? endpoint.capacity : each.value.profile != null ? var.tc_profiles[each.value.profile].endpoint_capacity : null
              }
  }]
}




