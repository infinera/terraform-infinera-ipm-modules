terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
  experiments = 
}

// Constellation Network Resource supports CRUD functions
resource "ipm_constellation_network" "constellation_networks" {
  for_each = { for network in var.networks : network.network_name => network }
  config = {
    name                    = each.value.network_name
    constellation_frequency = each.value.constellation_frequency != null ? each.value.constellation_frequency : each.value.profile == null ? null : var.network_config_profiles[var.network_profiles[each.value.profile].network_config_profile].constellation_frequency
    modulation = each.value.modulation != null ? each.value.modulation : each.value.profile == null ? null : var.network_config_profiles[var.network_profiles[each.value.profile].network_config_profile].modulation
    tc_mode = each.value.tc_mode != null ? each.value.tc_mode : each.value.profile == null ? null : var.network_config_profiles[var.network_profiles[each.value.profile].network_config_profile].tc_mode
    managed_by = each.value.managed_by != null ? each.value.managed_by : each.value.profile == null ? null : var.network_config_profiles[var.network_profiles[each.value.profile].network_config_profile].managed_by
    topology = each.value.topology != null ? each.value.topology : each.value.profile == null ? null : var.network_config_profiles[var.network_profiles[each.value.profile].network_config_profile].topology
  }
  hub_module = {
    config = {
      selector = each.value.hub_module.identifier.module_id == null ? (each.value.hub_module.identifier.module_name == null ? (each.value.hub_module.identifier.mac_address == null ? (each.value.hub_module.identifier.serial_number == null ? (each.value.hub_module.identifier.host_name == null ? (each.value.hub_module.identifier.host_port_id == null ? (each.value.hub_module.identifier.host_sys_name == null ? (each.value.hub_module.identifier.host_port_source_mac == null ? null : { host_port_selector_by_port_source_mac = { port_source_mac = each.value.hub_module.identifier.port_source_mac } }) : { host_port_selector_by_sys_name = { sys_name = each.value.hub_module.identifier.host_sys_name, port_id = each.value.hub_module.identifier.host_port_id, port_id_subtype = each.value.hub_module.identifier.host_port_id_subtype } }) : { host_port_selector_by_port_id = { chassis_id = each.value.hub_module.identifier.host_chassis_id, chassis_id_subtype = each.value.hub_module.identifier.host_chassis_id_subtype, port_id = each.value.hub_module.identifier.host_port_id, port_id_subtype = each.value.hub_module.identifier.host_port_id_subtype } }) : { host_port_selector_by_name = { host_name = each.value.hub_module.identifier.host_name, host_port_name = each.value.hub_module.identifier.host_port_name } }) : { module_selector_by_module_serial_number = { module_serial_number = each.value.hub_module.identifier.serial_number } }) : { module_selector_by_module_mac = { module_mac = each.value.hub_module.identifier.mac_address } }) : { module_selector_by_module_name = { module_name = each.value.hub_module.identifier.module_name } }) : { module_selector_by_module_id = { module_id = each.value.hub_module.identifier.module_id }
      }
      module = {
        traffic_mode = each.value.hub_module.traffic_mode != null ? each.value.hub_module.traffic_mode : each.value.profile == null ? null : var.module_config_profiles[var.network_profiles[each.value.profile].hub_config_profile].traffic_mode 
        fiber_connection_mode = each.value.hub_module.fiber_connection_mode != null ? each.value.hub_module.fiber_connection_mode : each.value.profile == null ? null : var.module_config_profiles[var.network_profiles[each.value.profile].hub_config_profile].fiber_connection_mode 
        planned_capacity = each.value.hub_module.planned_capacity != null ? each.value.hub_module.planned_capacity : each.value.profile == null ? null : var.module_config_profiles[var.network_profiles[each.value.profile].hub_config_profile].planned_capacity 
        requested_nominal_psd_offset = each.value.hub_module.requested_nominal_psd_offset != null ? each.value.hub_module.requested_nominal_psd_offset : each.value.profile == null ? null : var.module_config_profiles[var.network_profiles[each.value.profile].hub_config_profile].requested_nominal_psd_offset 
        fec_iterations = each.value.hub_module.fec_iterations != null ? each.value.hub_module.fec_iterations : each.value.profile == null ? null : var.module_config_profiles[var.network_profiles[each.value.profile].hub_config_profile].fec_iterations 
        tx_clp_target = each.value.hub_module.tx_clp_target != null ? each.value.hub_module.tx_clp_target : each.value.profile == null ? null : var.module_config_profiles[var.network_profiles[each.value.profile].hub_config_profile].tx_clp_target 
      }
    }
  }
}




