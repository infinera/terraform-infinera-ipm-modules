terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

// Constellation Network's leaf module supports CRUD functions
resource "ipm_leaf_module" "leaf_modules" {
  for_each   = { for module in var.leaf_modules : module.identifier.module_name == null ? (module.identifier.module_id == null ? (module.identifier.mac_address == null ? (module.identifier.serial_number == null ? module.identifier.host_name == null ? (module.identifier.host_chassis_id == null ? (module.identifier.host_sys_name == null ? (module.identifier.port_source_mac == null ? null : module.identifier.port_source_mac) : module.identifier.host_sys_name) : module.identifier.host_chassis_id) : module.identifier.host_name : module.identifier.serial_number) : module.identifier.mac_address) : module.identifier.module_id) : module.identifier.module_name => module }
  network_id = var.network_id
  config = {
    selector = each.value.identifier.module_id == null ? (each.value.identifier.module_name == null ? (each.value.identifier.mac_address == null ? (each.value.identifier.serial_number == null ? (each.value.identifier.host_name == null ? (each.value.identifier.host_port_id == null ? (each.value.identifier.host_sys_name == null ? (each.value.identifier.host_port_source_mac == null ? null : { host_port_selector_by_port_source_mac = { port_source_mac = each.value.identifier.port_source_mac } }) : { host_port_selector_by_sys_name = { sys_name = each.value.identifier.host_sys_name, port_id = each.value.identifier.host_port_id, port_id_subtype = each.value.identifier.host_port_id_subtype } }) : { host_port_selector_by_port_id = { chassis_id = each.value.identifier.host_chassis_id, chassis_id_subtype = each.value.identifier.host_chassis_id_subtype, port_id = each.value.identifier.host_port_id, port_id_subtype = each.value.identifier.host_port_id_subtype } }) : { host_port_selector_by_name = { host_name = each.value.identifier.host_name, host_port_name = each.value.identifier.host_port_name } }) : { module_selector_by_module_serial_number = { module_serial_number = each.value.identifier.serial_number } }) : { module_selector_by_module_mac = { module_mac = each.value.identifier.mac_address } }) : { module_selector_by_module_name = { module_name = each.value.identifier.module_name } }) : { module_selector_by_module_id = { module_id = each.value.identifier.module_id } }
    module = {
      traffic_mode                 = each.value.traffic_mode != null ? each.value.traffic_mode : each.value.profile != null ? var.module_config_profiles[each.value.profile].traffic_mode : var.leaf_config_profile != null ? var.module_config_profiles[var.leaf_config_profile].traffic_mode : null
      fiber_connection_mode        = each.value.fiber_connection_mode != null ? each.value.fiber_connection_mode : each.value.profile != null ? var.module_config_profiles[each.value.profile].fiber_connection_mode : var.leaf_config_profile != null ? var.module_config_profiles[var.leaf_config_profile].fiber_connection_mode : null
      planned_capacity             = each.value.planned_capacity != null ? each.value.planned_capacity : each.value.profile != null ? var.module_config_profiles[each.value.profile].planned_capacity : var.leaf_config_profile != null ? var.module_config_profiles[var.leaf_config_profile].planned_capacity : null
      requested_nominal_psd_offset = each.value.requested_nominal_psd_offset != null ? each.value.requested_nominal_psd_offset : each.value.profile != null ? var.module_config_profiles[each.value.profile].requested_nominal_psd_offset : var.leaf_config_profile != null ? var.module_config_profiles[var.leaf_config_profile].requested_nominal_psd_offset : null
      fec_iterations               = each.value.fec_iterations != null ? each.value.fec_iterations : each.value.profile != null ? var.module_config_profiles[each.value.profile].fec_iterations : var.leaf_config_profile != null ? var.module_config_profiles[var.leaf_config_profile].fec_iterations : null
      tx_clp_target                = each.value.tx_clp_target != null ? each.value.tx_clp_target : each.value.profile != null ? var.module_config_profiles[each.value.profile].tx_clp_target : var.leaf_config_profile != null ? var.module_config_profiles[var.leaf_config_profile].tx_clp_target : null
    }
  }
}
