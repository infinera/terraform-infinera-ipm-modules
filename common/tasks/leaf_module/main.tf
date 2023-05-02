terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

// Constellation Network's leaf module supports CRUD functions
resource "ipm_leaf_module" "leaf_modules" {
  for_each   = { for module in var.leaf_modules : module.name => module }
  network_id = var.network_id
  config = {
      selector = each.value.id == null ? (each.value.name == null ? (each.value.mac_address == null ? (each.value.serrial_number == null ? (each.value.host_name == null ? (each.value.host_port_id == null? (each.value.host_sys_name == null ? (each.value.host_port_source_mac == null ? null : { host_port_selector_by_port_source_mac = { port_source_mac = each.value.port_source_mac }}) : { host_port_selector_by_sys_name = { sys_name = each.value.host_sys_name,  port_id = each.value.host_port_id, port_id_sub_type = each.value.host_port_id_sub_type  }}) : { host_port_selector_by_port_id = { chassis_id = each.value.host_chassis_id, chassis_id_sub_type = each.value.host_chassis_id_sub_type, port_id = each.value.host_port_id, port_id_sub_type = each.value.host_port_id_sub_type }}) : { host_port_selector_by_name = { host_name = each.value.host_name, host_port_name = each.value.host_port_name }}) : { module_selector_by_module_serial_number = { module_serial_number = each.value.serial_number } }) : { module_selector_by_module_mac = { module_mac = each.value.mac_address }}) : { module_selector_by_module_name = { module_name = each.value.name }}) : { module_selector_by_module_id = { module_id = each.value.id } 
      }
    module = {
      traffic_mode = each.value.config == null ? (each.value.config_profile == null ? (var.network_config_profile == null ? null : var.network_config_profile.traffic_mode) : var.module_config_profiles[each.value.config_profile].traffic_mode) :  (each.value.config.traffic_mode == null ? (each.value.config_profile == null ? (var.network_config_profile == null ? null : var.network_config_profile.traffic_mode) : var.module_config_profiles[each.value.config_profile].traffic_mode) : each.value.config.traffic_mode)
      fiber_connection_mode = each.value.config == null ? (each.value.config_profile == null ? (var.network_config_profile == null ? null : var.network_config_profile.fiber_connection_mode) : var.module_config_profiles[each.value.config_profile].fiber_connection_mode) :  (each.value.config.fiber_connection_mode == null ? (each.value.config_profile == null ? (var.network_config_profile == null ? null : var.network_config_profile.fiber_connection_mode) : var.module_config_profiles[each.value.config_profile].fiber_connection_mode) : each.value.config.fiber_connection_mode)
      planned_capacity = each.value.config == null ? each.value.config_profile == null ? var.network_config_profile == null ? null : var.network_config_profile.planned_capacity : var.module_config_profiles[each.value.config_profile].planned_capacity == null? var.network_config_profile == null ? null : var.network_config_profile.planned_capacity : var.module_config_profiles[each.value.config_profile].planned_capacity : each.value.config.planned_capacity == null ? var.network_config_profile == null ? null : var.network_config_profile.planned_capacity : each.value.config.planned_capacity
      requested_nominal_psd_offset = each.value.config == null ? (each.value.config_profile == null ? (var.network_config_profile == null ? null : var.network_config_profile.requested_nominal_psd_offset) : var.module_config_profiles[each.value.config_profile].requested_nominal_psd_offset) :  (each.value.config.requested_nominal_psd_offset == null ? (each.value.config_profile == null ? (var.network_config_profile == null ? null : var.network_config_profile.requested_nominal_psd_offset) : var.module_config_profiles[each.value.config_profile].requested_nominal_psd_offset) : each.value.config.requested_nominal_psd_offset)
      fec_iterations = each.value.config == null ? (each.value.config_profile == null ? (var.network_config_profile == null ? null : var.network_config_profile.fec_iterations) : var.module_config_profiles[each.value.config_profile].fec_iterations) :  (each.value.config.fec_iterations == null ? (each.value.config_profile == null ? (var.network_config_profile == null ? null : var.network_config_profile.fec_iterations) : var.module_config_profiles[each.value.config_profile].fec_iterations) : each.value.config.fec_iterations)
      tx_clp_target = each.value.config == null ? (each.value.config_profile == null ? (var.network_config_profile == null ? null : var.network_config_profile.tx_clp_target) : var.module_config_profiles[each.value.config_profile].tx_clp_target) :  (each.value.config.tx_clp_target == null ? (each.value.config_profile == null ? (var.network_config_profile == null ? null : var.network_config_profile.tx_clp_target) : var.module_config_profiles[each.value.config_profile].tx_clp_target) : each.value.config.tx_clp_target)
    }
  }
}
