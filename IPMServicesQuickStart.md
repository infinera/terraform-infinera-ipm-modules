# IPM Services Quick Start
## Preconditions:
1. IPM Service Docker Image. Please see [IPM Services Docker Image and Container](https://bitbucket.infinera.com/projects/MAR/repos/terraform-provider-ipm/browse/IPM%20Services%20Docker%20Image%20and%20Container.md)
2. Intent Files. Sample intent files are located in *use-cases/user-intents* directory. Please see [Intent Definition](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Intent.md) for more details.
3. System and User Profile files. Sample of system and user profile files are located in *use-cases/system-profiles* and *use-cases/user-profile* directories. Please see [User Profile Files](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Profiles.md) for  more details.

## Procedures
1. Start up the docker container in desired working directory by executing this command *'docker run -it -v $ABC:/XYZ --add-host=$IPM_HOST_NAME:$IPM_HOST_IP_ADDRESS $imageName $workingDir'*.
   1. *\$ABC* is host directory which will be mapped to the volume *"/XYZ" (XYZ can be any valid name)* in the container.
   2. *\$imageName* is *"sv-artifactory.infinera.com/marvel/ipm/ipm-services:v0.0.1"*
   3. *\$workingDir* is the directory in the host directory *ABC* which will be created in the *\$workingDir* as needed. The container will start in this directory.
   
   Example:
   ```
   docker run -it -v "$(pwd)":/Work-Directory --add-host=pt-xrivk824-dv:10.46.76.81 sv-artifactory.infinera.com/marvel/ipm/ipm-services:v0.0.1 bash
   ```
2. Now in the container's bash shell under *\$WorkingDir* directory,the support IPM Service commands are available to provision IPM service resources as shown below:

| Support Host Management Command         |  Description                                   | Man Page    |
|-------------------------|------------------------------------------------|-------------|
| get_hosts.sh  *[id]*           | Get all or a specific host | [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_hosts.md)     |
| get_hosts_port.sh  *host_id*      | Get all Host's port or a specific Port | [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_host_port.md)     |

| Support Module Management Command         |  Description                                   | Man Page    |
|-------------------------|------------------------------------------------|-------------|
| get_modules.sh  *[id]*           | Get all or a specific module | [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_modules.md)     |
| get_acs.sh *module_id eclient_col_id [ac_col_id]*            |     | [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_acs.md)       |
| get_carriers.sh *module_id line_ptp_col_id [carrier_col_id]*            |     | [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_carriers.md)       |
| get_dscgs.sh *module_id line_ptp_col_id carrier_col_id [dscg_col_id]*            |     |    |
| get_dscs.sh *module_id line_ptp_col_id carrier_col_id [dsc_col_id]*            |     |    |
| get_ethernet_clients.sh *module_id [eClient_col_id]*            |     |    |
| get_lcs.sh *module_id [lc_col_id]*            |     |    |
| get_line_ptps.sh  *module_id [linePTP_col_id]*           |     |    |
| get_otus.sh *module_id [otu_col_id]*           |     |    |
| get_odus.sh *module_id otu_col_id [odu_col_id]*            |     |    |


| Support Network Management Command         |  Description                                   | Man Page    |
|-------------------------|------------------------------------------------|-------------|
| networks.sh               | XR Network CRUD management | [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/networks.md)     |
| get_networks.sh *[id]*           | Get all or a specific XR networks | [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_networks.md)    |
| get_hub_modules.sh *nc_id*        | Get hub module for a specific XR Network |  [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_hub_modules.md)    |
| get_leaf_modules.sh  *nc_id*       | Get leaf modules for a specific XR Network | [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_leaf_modules.md)     |
| get_reachable_modules.sh  *nc_id*  | Get reachable modules for a specific XR Network | [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_reachable_modules.md)     |

| Support Transport Capacity Management Command         |  Description                                   | Man Page    |
|-------------------------|------------------------------------------------|-------------|
| tcs.sh                     | Transport capacity CRUD management|  [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/tcs.md)    |
| get_tcs.sh  *[id]*                | Get all or specific Transport capacities|  [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_tcs.md)    |
| get_tc_endpoints.sh  *lc_id*       | Get Transport capacity's endpoints |  [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_tc_endpoints.md)    |
| get_tc_capacity_links.sh   | Get Transport capacity's capacity links |  [man page](https://github.com/infinera/terraform-ipm_modules/blob/master/use-cases/man-pages/get_tcs_capacity_links.md)   |

| Support Network Connection Management Command         |  Description                                   | Man Page    |
|-------------------------|------------------------------------------------|-------------|
| ncs.sh                     | Network Connection CRUD management|  TBD    |
| get_ncs.sh  *[id]*                | Get all or specific Network Connection |  TBD    |
| get_ncs_endpoints.sh  *nc_id*      | Get Network Connection's Endpoints |  TBD    |
| get_ncs_lcs.sh  *nc_id*      | Get Network Connection's local connections |  TBD    |
| get_ncs_acs.sh  *nc_id*      | Get Network Connection's attachment circuits |  TBD    |

| Support NDU Management Command         |  Description                                   | Man Page    |
|-------------------------|------------------------------------------------|-------------|
| get_ndus.sh *id*                    | |      |
| get_ndu_eclients.sh  *ndu_id [eclient_col_id]*     | |      |
| get_ndu_carriers.sh  *ndu_id port_col_id line_ptp_col_id [carrier_col_id]*   | |      |
| get_ndu_edfas.sh  *ndu_id port_col_id [efda_col_id]*                   | |      |
| get_ndu_lcs.sh  *ndu_id [lc_col_id]*    | |      |
| get_ndu_line_ptps.sh *ndu_id port_col_id [linePTP_col_id]*    | |      |
| get_ndu_otus.sh  *ndu_id [otu_col_id]*     | |      |
| get_ndu_odus.sh *ndu_id otu_col_id[odu_col_id]* | |      |
| get_ndu_pol_ptps.sh  *ndu_id port_col_id [polPTP_col_id]*   | |      |
| get_ndu_ports.sh  *ndu_id [port_col_id]*   | |      |
| get_ndu_toms.sh  *ndu_id port_col_id [tom_col_id]*                   | |      |
| get_ndu_trib_ptps.sh  *ndu_id port_col_id [tribPTP_col_id]* | |      |
| get_ndu_voas.sh  *ndu_id port_col_id [voas_col_id]*  | |      |
| get_ndu_xrs.sh  *ndu_id port_col_id [xrs_col_id]* | |      |

## XR Network Examples
```
# get all modules
get_modules all init=y

# create network 
networks create init=y intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/network_profiles.json user_profile=/Work-Directory/user-profiles/network_profiles.json

# get all networks
get_networks all

# get created network's modules. $networkId is the id of the created network.
get_hub_module $networkId init=y
get_leaf_modules $networkId init=y
get_reachable_modules $networkId init=y

# update network
networks updated intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/network_profiles.json user_profile=/Work-Directory/user-profiles/
get_networks all
get_hub_module $networkId
get_leaf_modules $networkId
get_reachable_modules $networkId

# delete network
networks delete intent=/Work-Directory/user-intents/networks.tfvars

# verify that that the network is deleted
get_networks networkId
```

## Transport Capacity Examples
```
# get all TCs
get_tcs all init=y

# create network 
tcs create init=y intent=/Work-Directory/user-intents/tcs.tfvars system_profile=/Work-Directory/system_profiles/tcs_profiles.json user_profile=/Work-Directory/user-profiles/tcs_profiles.json

# get all networks
get_tcs all

# get created network's endpoints and Capacity Links. $networkId is the id of the created network.
get_tc-endpoints $TCId init=y
get_tcs-capacity-links $id init=y

# update network
tcs update intent=/Work-Directory/user-intents/tcs.tfvars system_profile=/Work-Directory/system_profiles/tcs_profiles.json user_profile=/Work-Directory/user-profiles/tcs_profiles.json
get_tcs all
get_tc-endpoints $TCId
get_tcs-capacity-links $id

# delete network
tcs delete intent=/Work-Directory/user-intents/tcs.tfvars 

# verify that that the network is deleted
get_tcs $TCId
```

## Trouble Shooting
If terraform **command** fails for any reason, the terraform state file may need to be removed and run "terraform init" again. Execute the command *"networks command init=yes intent=networks.tfvars"*
