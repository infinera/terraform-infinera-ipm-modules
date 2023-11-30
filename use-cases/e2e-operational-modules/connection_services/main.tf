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
  host     = "ipm-5"
}

module "networks" {
  //source   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//network-service/workflows/networks"
  source = "../../../network-service/workflows/networks"

  networks       = var.networks
  system_profile = "network_profiles.json"
  user_profile   = ""
}

resource "time_sleep" "wait_10_seconds" {
  depends_on = [module.networks]

  create_duration = "10s"
}


module "transport_capacities" {
  //source   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//transport-capacity-service/workflows/transport_capacities"
  source     = "../../../transport-capacity-service/workflows/transport_capacities"
  //depends_on = [module.networks]
  depends_on = [time_sleep.wait_10_seconds]

  transport_capacities = var.transport_capacities
  system_profile       = "tc_profiles.json"
  user_profile         = ""
}

module "network_connections" {
  //source   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//network-connection-service/workflows/network_connections"
  source = "../../../network-connection-service/workflows/network_connections"
  depends_on = [module.transport_capacities]

  network_connections = var.network_connections
  system_profile      = "nc_profiles.json"
  user_profile        = ""
}