
terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~>0.4.0"
    }
  }
}

// Constellation Network Resource supports CRUD functions
resource "ipm_transport_capacity" "transport_capacities" {

  for_each = { for tc in var.transport_capacities : join("/", [tc.end_points[0].identifier.module_name != null ? tc.end_points[0].identifier.module_name : tc.end_points[0].identifier.module_id != null ? tc.end_points[0].identifier.module_id : tc.end_points[0].identifier.serial_number != null ? tc.end_points[0].identifier.serial_number : tc.end_points[0].identifier.mac_address != null ? tc.end_points[0].identifier.mac_address : "", tc.end_points[1].identifier.module_name != null ? tc.end_points[1].identifier.module_name : tc.end_points[1].identifier.module_id != null ? tc.end_points[1].identifier.module_id : tc.end_points[1].identifier.serial_number != null ? tc.end_points[1].identifier.serial_number : tc.end_points[1].identifier.mac_address != null ? tc.end_points[1].identifier.mac_address : "", tc.capacity_mode != null ? tc.capacity_mode : tc.profile != null ? var.profiles[tc.profile].capacity_mode : "", tostring(tc.end_points[0].capacity != null ? tc.end_points[0].capacity : tc.profile != null ? var.profiles[tc.profile].endpoint_capacity : 100)]) => tc }
  config = {
    name          = each.value.name
    capacity_mode = each.value.capacity_mode != null ? each.value.capacity_mode : each.value.profile != null ? var.profiles[each.value.profile].capacity_mode : null
    labels        = each.value.labels != null ? each.value.labels : each.value.profile != null ? var.profiles[each.value.profile].labels : null
  }
  end_points = [ for endpoint in each.value.end_points :
    {
      config = {
        selector = endpoint.identifier.module_id != null ? { module_if_selector_by_module_id = { module_id = endpoint.identifier.module_id, module_client_if_aid = endpoint.identifier.module_client_if_aid } } : endpoint.identifier.module_name != null ? { module_if_selector_by_module_name = { module_name = endpoint.identifier.module_name, module_client_if_aid = endpoint.identifier.module_client_if_aid } } : endpoint.identifier.mac_address != null ? { module_if_selector_by_module_mac = { module_mac = endpoint.identifier.mac_address, module_client_if_aid = endpoint.identifier.module_client_if_aid } } : endpoint.identifier.serial_number != null ? { module_if_selector_by_module_serial_number = { module_serial_number = endpoint.identifier.serial_number, module_client_if_aid = endpoint.identifier.module_client_if_aid } } : endpoint.identifier.host_name != null ? { host_port_selector_by_name = { host_name = endpoint.identifier.host_name, host_port_name = endpoint.identifier.host_port_name } } : endpoint.identifier.host_port_id == null ? { host_port_selector_by_port_id = { chassis_id = endpoint.identifier.host_chassis_id, chassis_id_subtype = endpoint.identifier.host_chassis_id_subtype, port_id = endpoint.identifier.host_port_id, port_id_subtype = endpoint.identifier.host_port_id_subtype } } : endpoint.identifier.host_sys_name != null ? { host_port_selector_by_sys_name = { sys_name = endpoint.identifier.host_sys_name, port_id = endpoint.identifier.host_port_id, port_id_subtype = endpoint.identifier.host_port_id_subtype } } : endpoint.identifier.host_port_source_mac != null ? { host_port_selector_by_port_source_mac = { port_source_mac = endpoint.identifier.port_source_mac } }: null
        capacity = endpoint.capacity != null ? endpoint.capacity : each.value.profile != null ? var.profiles[each.value.profile].endpoint_capacity : null
      }
    }
  ]
}




