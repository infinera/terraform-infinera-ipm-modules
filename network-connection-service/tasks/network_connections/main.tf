
terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm/config"
      version = "~> 0.4.0"
    }
  }
}

// Constellation Network Resource supports CRUD functions
resource "ipm_network_connection" "network_connections" {
  for_each = { for nc in var.network_connections : join("/", [nc.end_points[0].identifier.module_name != null ? nc.end_points[0].identifier.module_name : nc.end_points[0].identifier.module_id != null ? nc.end_points[0].identifier.module_id : nc.end_points[0].identifier.serial_number != null ? nc.end_points[0].identifier.serial_number : nc.end_points[0].identifier.mac_address != null ? nc.end_points[0].identifier.mac_address : "", nc.end_points[1].identifier.module_name != null ? nc.end_points[1].identifier.module_name : nc.end_points[1].identifier.module_id != null ? nc.end_points[1].identifier.module_id : nc.end_points[1].identifier.serial_number != null ? nc.end_points[1].identifier.serial_number : nc.end_points[1].identifier.mac_address != null ? nc.end_points[1].identifier.mac_address : "", nc.service_mode != null ? nc.service_mode : nc.profile != null ? var.profiles[nc.profile].service_mode : "", tostring(nc.end_points[0].capacity != null ? nc.end_points[0].capacity : nc.profile != null ? var.profiles[nc.profile].endpoint_capacity : 100)]) => nc }
  config = {
    name                        = each.value.name
    service_mode                = each.value.service_mode != null ? each.value.service_mode : each.value.profile == null ? null : var.profiles[each.value.profile].service_mode
    mc                          = each.value.mc != null ? each.value.mc : each.value.profile == null ? null : var.profiles[each.value.profile].mc
    outer_vid                   = each.value.outer_vid != null ? each.value.profile == null ? null : each.value.outer_vid : var.profiles[each.value.profile].outer_vid
    implicit_transport_capacity = each.value.implicit_transport_capacity != null ? each.value.implicit_transport_capacity : each.value.profile == null ? null : var.profiles[each.value.profile].implicit_transport_capacity
    labels                      = each.value.labels != null ? each.value.labels : each.value.profile == null ? null : var.profiles[each.value.profile].labels
  }
  end_points = [for endpoint in each.value.end_points :
    {
      config = {
        selector = endpoint.identifier.module_id != null ? { module_if_selector_by_module_id = { module_id = endpoint.identifier.module_id, module_client_if_aid = endpoint.identifier.module_client_if_aid } } : endpoint.identifier.module_name != null ? { module_if_selector_by_module_name = { module_name = endpoint.identifier.module_name, module_client_if_aid = endpoint.identifier.module_client_if_aid } } : endpoint.identifier.mac_address != null ? { module_if_selector_by_module_mac = { module_mac = endpoint.identifier.mac_address, module_client_if_aid = endpoint.identifier.module_client_if_aid } } : endpoint.identifier.serial_number != null ? { module_if_selector_by_module_serial_number = { module_serial_number = endpoint.identifier.serial_number, module_client_if_aid = endpoint.identifier.module_client_if_aid } } : endpoint.identifier.host_name != null ? { host_port_selector_by_name = { host_name = endpoint.identifier.host_name, host_port_name = endpoint.identifier.host_port_name } } : endpoint.identifier.host_port_id == null ? { host_port_selector_by_port_id = { chassis_id = endpoint.identifier.host_chassis_id, chassis_id_subtype = endpoint.identifier.host_chassis_id_subtype, port_id = endpoint.identifier.host_port_id, port_id_subtype = endpoint.identifier.host_port_id_subtype } } : endpoint.identifier.host_sys_name != null ? { host_port_selector_by_sys_name = { sys_name = endpoint.identifier.host_sys_name, port_id = endpoint.identifier.host_port_id, port_id_subtype = endpoint.identifier.host_port_id_subtype } } : endpoint.identifier.host_port_source_mac != null ? { host_port_selector_by_port_source_mac = { port_source_mac = endpoint.identifier.port_source_mac } }: null
        capacity = endpoint.capacity != null ? endpoint.capacity : var.profiles[each.value.profile].endpoint_capacity
      }
  }]
}