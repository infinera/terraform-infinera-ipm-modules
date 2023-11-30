variable "ndus" {
  type = list(object({ identifier = object({ ndu_name = optional(string), ndu_id = optional(string), ndu_serial_number = optional(string), ndu_mac_address = optional(string) }),
                       profile  = optional(string), name = optional(string), location = optional(object({description=optional(string), clli=optional(string), latitude=optional(string), longitude=optional(string), altitude=optional(string)})), contact = optional(string), managedBy = optional(string), labels = optional(map(string)), polPowerCtrlMode = optional(string) }))
  description = "ndus for specified network name "
  default = [{ identifier = { ndu_name = "NDU1" }, labels : { "region" : "South" } }]
}

variable "ndu_profiles" {
  type = map(object({name = optional(string), location = optional(object({description=optional(string), clli=optional(string), latitude=optional(string), longitude=optional(string), altitude=optional(string)})), contact = optional(string), managedBy = optional(string), labels = optional(map(string)), polPowerCtrlMode = optional(string), labels = optional(map(string)) }))
  description = "Map of ndus' profiles"
}

