terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

// Constellation Network Resource supports CRUD functions
resource "ipm_constellation_network" "constellation_networks" {
  for_each = { for network in var.networks : network.name => network }
    config = {
      name                    = each.value.name
      constellation_frequency = each.value.config == null ? var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].constellation_frequency: each.value.config.constellation_frequency != null ? each.value.config.constellation_frequency : var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].constellation_frequency
      modulation              = each.value.config == null ? var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].modulation : each.value.config.modulation != null ? each.value.config.modulation : var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].modulation
      tc_mode              = each.value.config == null ? var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].tc_mode : each.value.config.tc_mode != null ? each.value.config.tc_mode : var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].tc_mode
      managed_by              = each.value.config == null ? var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].managed_by : each.value.config.managed_by != null ? each.value.config.managed_by : var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].managed_by
    }
    hub_module = {
      config = {
        selector = each.value.hub_module.id == null ? (each.value.hub_module.name == null ? (each.value.hub_module.mac_address == null ? (each.value.hub_module.serrial_number == null ? (each.value.hub_module.host_name == null ? (each.value.hub_module.host_port_id == null? (each.value.hub_module.host_sys_name == null ? (each.value.hub_module.host_port_source_mac == null ? null : { host_port_selector_by_port_source_mac = { port_source_mac = each.value.hub_module.port_source_mac }}) : { host_port_selector_by_sys_name = { sys_name = each.value.hub_module.host_sys_name,  port_id = each.value.hub_module.host_port_id, port_id_sub_type = each.value.hub_module.host_port_id_sub_type  }}) : { host_port_selector_by_port_id = { chassis_id = each.value.hub_module.host_chassis_id, chassis_id_sub_type = each.value.hub_module.host_chassis_id_sub_type, port_id = each.value.hub_module.host_port_id, port_id_sub_type = each.value.hub_module.host_port_id_sub_type }}) : { host_port_selector_by_name = { host_name = each.value.hub_module.host_name, host_port_name = each.value.hub_module.host_port_name }}) : { module_selector_by_module_serial_number = { module_serial_number = each.value.hub_module.serial_number } }) : { module_selector_by_module_mac = { module_mac = each.value.hub_module.mac_address }}) : { module_selector_by_module_name = { module_name = each.value.hub_module.name }}) : { module_selector_by_module_id = { module_id = each.value.hub_module.id } 
      }
      module = {
        traffic_mode = each.value.hub_module.config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].traffic_mode : each.value.hub_module.config.traffic_mode != null ? each.value.hub_module.config.traffic_mode : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].traffic_mode
        fiber_connection_mode = each.value.hub_module.config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].fiber_connection_mode : each.value.hub_module.config.fiber_connection_mode != null ? each.value.hub_module.config.fiber_connection_mode : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].fiber_connection_mode
        planned_capacity          = each.value.hub_module.config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].planned_capacity : each.value.hub_module.config.planned_capacity != null ? each.value.hub_module.config.planned_capacity : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].planned_capacity
        requested_nominal_psd_offset = each.value.hub_module.config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].requested_nominal_psd_offset : each.value.hub_module.config.requested_nominal_psd_offset != null ? each.value.hub_module.config.requested_nominal_psd_offset : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].requested_nominal_psd_offset
        fec_iterations = each.value.hub_module.config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].fec_iterations : each.value.hub_module.config.fec_iterations != null ? each.value.hub_module.config.fec_iterations : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].fec_iterations
        tx_clp_target = each.value.hub_module.config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].tx_clp_target : each.value.hub_module.config.tx_clp_target != null ? each.value.hub_module.config.tx_clp_target : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].tx_clp_target
      }
    }
  }
}




