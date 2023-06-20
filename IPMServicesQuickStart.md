# IPM Services Quick Start
## Preconditions:
1. IPM Service Docker Image. Please see [IPM Services Docker Image and Container](https://bitbucket.infinera.com/projects/MAR/repos/terraform-provider-ipm/browse/IPM%20Services%20Docker%20Image%20and%20Container.md)
2. Intent Files. Sample intent files are located in *use-cases/user-intents* directory. Please see [Intent Definition](https://github.com/infinera/terraform-ipm-modules/blob/master/network-service/Intent.md) for more details.
3. System and User Profile files. Sample of system and user profile files are located in *use-cases/system-profiles* and *use-cases/user-profile* directories. Please see [User Profile Files](https://github.com/infinera/terraform-ipm-modules/blob/master/network-service/Profiles.md) for  more details.

## Procedures
1. Start up the docker container in desired working directory by executing this command *'docker run -it -v $ABC:/XYZ --add-host=$IPM_HOST_NAME:$IPM_HOST_IP_ADDRESS $imageName $workingDir'*.
   1. *\$ABC* is host directory which will be mapped to the volume *"/XYZ" (XYZ can be any valid name)* in the container.
   2. *\$imageName* is *"sv-artifactory.infinera.com/marvel/ipm/ipm-services:v0.0.1"*
   3. *\$workingDir* is the directory in the host directory *ABC* which will be created in the *\$workingDir* as needed. The container will start in this directory.
2. Now in the container's bash shell under *\$WorkingDir* directory,the support IPM Service commands are available to provision IPM service resources as shown below:

| Support Command         |  Description                                   | Man Page    |
|-------------------------|------------------------------------------------|-------------|
| get-modules.sh             | Get all or a specific module | [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_modules.md)     |
| networks.sh                | XR Network CRUD management | [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/networks.md)     |
| get-networks.sh            | Get all or a specific XR networks | [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_networks.md)    |
| get-hub-modules.sh         | Get hub module for a specific XR Network |  [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_hub_modules.md)    |
| get-leaf-modules.sh        | Get leaf modules for a specific XR Network | [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_leaf_modules.md)     |
| get-reachable-modules.sh   | Get reachable modules for a specific XR Network | [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_reachable_modules.md)     |
| tcs.sh                     | Transport capacity CRUD management|  [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/tcs.md)    |
| get-tcs.sh                 | Get all or specific Transport capacities|  [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_tcs.md)    |
| get-tc_endpoints.sh        | Get Transport capacity's endpoints |  [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_tc_endpoints.md)    |
| get-tc_capacity_links.sh   | Get Transport capacity's capacity links |  [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_tcs_capacity_links.md)   |
| ncs.sh                     | Network Connection CRUD management|  TBD    |
| get_ncs.sh                 | Get all or specific Network Connection |  TBD    |
| get_ncs_endpoints.sh       | Get Network Connection's Endpoints |  TBD    |
| get_ncs_lcs.sh       | Get Network Connection's local connections |  TBD    |
| get_ncs_acs.sh       | Get Network Connection's attachment circuits |  TBD    |

## XR Network Examples
```
# get all modules
get-modules all init=y

# create network 
networks create init=y intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/network_profiles.json user_profile=/Work-Directory/user-profiles/network_profiles.json

# get all networks
get-networks all

# get created network's modules. $networkId is the id of the created network.
get-hub-module $networkId init=y
get-leaf-modules $networkId init=y
get-reachable-modules $networkId init=y

# update network
networks updated intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/network_profiles.json user_profile=/Work-Directory/user-profiles/
get-networks all
get-hub-module $networkId
get-leaf-modules $networkId
get-reachable-modules $networkId

# delete network
networks delete intent=/Work-Directory/user-intents/networks.tfvars

# verify that that the network is deleted
get-networks networkId
```

## Transport Capacity Examples
```
# get all TCs
get-tcs all init=y

# create network 
tcs create init=y intent=/Work-Directory/user-intents/tcs.tfvars system_profile=/Work-Directory/system_profiles/tcs_profiles.json user_profile=/Work-Directory/user-profiles/tcs_profiles.json

# get all networks
get-tcs all

# get created network's endpoints and Capacity Links. $networkId is the id of the created network.
get-tc-endpoints $TCId init=y
get-tcs-capacity-links $id init=y

# update network
tcs update intent=/Work-Directory/user-intents/tcs.tfvars system_profile=/Work-Directory/system_profiles/tcs_profiles.json user_profile=/Work-Directory/user-profiles/tcs_profiles.json
get-tcs all
get-tc-endpoints $TCId
get-tcs-capacity-links $id

# delete network
tcs delete intent=/Work-Directory/user-intents/tcs.tfvars 

# verify that that the network is deleted
get-tcs $TCId
```

## Trouble Shooting
If terraform **command** fails for any reason, the terraform state file may need to be removed and run "terraform init" again. Execute the command *"networks command init=yes intent=networks.tfvars"*
