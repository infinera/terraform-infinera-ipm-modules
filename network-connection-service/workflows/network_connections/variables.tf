variable "network_connections" {
  type = list(object({ profile = optional(string),
    name      = optional(string), service_mode = optional(string), mc = optional(string),
    outer_vid = optional(string), implicit_transport_capacity = optional(string), labels = optional(map(string)),
    end_points = list(object({ identifier = object({ module_name = optional(string), module_id = optional(string), serial_number = optional(string), module_client_if_aid = optional(string),
      mac_address     = optional(string), host_port_name = optional(string), host_name = optional(string),
      host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
      host_port_id    = optional(string), host_port_id_subtype = optional(string),
      host_sys_name = optional(string), host_port_source_mac = optional(string) }),
    capacity = optional(number) }))
  }))
  description = "List of Network Connection"
}

//  type = map(object({ service_mode = optional(string), mc = optional(string), outer_vid = optional(string),
//  implicit_transport_capacity = optional(string), labels = optional(map(string)), endpoint_capacity : optional(string) }))
//  description = "Map of NC Config profiles"
variable "system_profile" {
  type = string
}

//  type = map(object({ service_mode = optional(string), mc = optional(string), outer_vid = optional(string),
//  implicit_transport_capacity = optional(string), labels = optional(map(string)), endpoint_capacity : optional(string) }))
//  description = "Map of NC Config profiles"
variable "user_profile" {
  type = string
}

