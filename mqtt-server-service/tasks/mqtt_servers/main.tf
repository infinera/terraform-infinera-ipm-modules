terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~> 0.4.0"
    }
  }
}


locals {
   servers = { for server in var.mqtt_servers : server.identifier.module_name != null ? server.identifier.module_name : server.identifier.module_id != null ? server.identifier.module_id : server.identifier.module_serial_number != null ? server.identifier.module_serial_number : server.identifier.module_mac_address != null ? server.identifier.module_mac_address : "" => server }
}

data "ipm_modules" "modules" {
  for_each = local.servers
    name = each.value.identifier.module_name != null ? each.value.identifier.module_name : null
    id = each.value.identifier.module_id != null ? each.value.identifier.module_id : null
    serial_number = each.value.identifier.module_serial_number != null ? each.value.identifier.module_serial_number : null
    mac_address = each.value.identifier.module_mac_address != null ? each.value.identifier.module_mac_address : null
}

/*resource "ipm_mqtt_server" "mqtt_server" {
  for_each = local.servers
    //device_id =  data.ipm_modules.modules[each.key].id
    device_id = data.ipm_modules.modules[each.key].modules[0].id
    server_id =  each.value.identifier.server_id
}*/


resource "ipm_mqtt_server" "mqtt_servers" {
  for_each = local.servers
    //device_id =  data.ipm_modules.modules[each.key].id
    device_id = data.ipm_modules.modules[each.key].modules[0].id
    server_id =  each.value.identifier.server_id
    server =  each.value.server != null ?  each.value.server : null
    port =  each.value.port != null ?  each.value.port : null
    type =  each.value.type != null ?  each.value.type : null
    sub_type =  each.value.sub_type != null ?  each.value.sub_type : null
    enabled =  each.value.enabled != null ?  each.value.enabled : null
    log_level =  each.value.log_level != null ?  each.value.log_level : null
    region =  each.value.region != null ?  each.value.region : null
}




