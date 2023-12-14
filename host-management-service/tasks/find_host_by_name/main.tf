terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~>0.4.0"
    }
  }
}

data "ipm_hosts" "hosts" {
}

locals {
  found_host = [for host in data.ipm_hosts.hosts.hosts : host if host.state.sys_name == var.name]
}

output "found_module" {
  value = length(local.found_host) > 0 ? found_host[0] : null
}

variable name {
  type = string
  default = "Kissimmee"
}


