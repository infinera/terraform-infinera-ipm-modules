terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }

  }
}

provider "ipm" {
  username = "xr-user-1"
  password = "infinera"
  host     = "ipm-eval2.westus3.cloudapp.azure.com"
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


