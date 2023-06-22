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
