variable "ndus" {
  type = list(object({ identifier = object({ ndu_name = optional(string), ndu_id = optional(string), ndu_serial_number = optional(string), ndu_mac_address = optional(string) }),
                       profile  = optional(string), name = optional(string), location = optional(object({description=optional(string), clli=optional(string), latitude=optional(string), longitude=optional(string), altitude=optional(string)})), contact = optional(string), managedBy = optional(string), labels = optional(map(string)), polPowerCtrlMode = optional(string), labels = optional(map(string)) }))
  description = "ndus for specified network name "
  default = [{ identifier = { ndu_name = "NDU1" }, labels : { "region" : "South" } }]
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

