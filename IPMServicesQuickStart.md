# IPM Services Quick Start
## Preconditions:
1. IPM Service Docker Image. Please see [IPM Services Docker Image and Container](https://bitbucket.infinera.com/projects/MAR/repos/terraform-provider-ipm/browse/IPM%20Services%20Docker%20Image%20and%20Container.md)
2. Intent Files. Sample intent files are located in *use-cases/user-intents* directory. Please see [Intent Definition](https://github.com/infinera/terraform-ipm-modules/blob/master/network-service/Intent.md) for more details.
3. System and User Profile files. Sample of system and user profile files are located in *use-cases/system-profiles* and *use-cases/user-profile* directories. Please see [User Profile Files](https://github.com/infinera/terraform-ipm-modules/blob/master/network-service/Profiles.md) for  more details.

## Procedures
1. Bring up the docker container in desired working directory by executing this command *'docker run -it -v ABC:/XYZ --add-host=pt-xrivk824-dv:10.46.76.81 sv-artifactory.infinera.com/marvel/ipm/ipm-services:v0.0.1 bash'*. *ABC* is host directory which will be mapped to the volume *"/XYZ" (XYZ can be any valid name)* in the container.  
2. In the container's bash shell, execute the command *". setup.sh AAA"*. The */XYZ/AAA* working directory will be created as the current directory. In this working directory, the user can enter IPM service commands to manage the IPM XR resources such as networks, transport capacities, network connections, etc. Please see [*". setup.sh man page"*](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/setup.md) for more details.
3. Now the support IPM Service commands are available to provision IPM service resources as shown below:

| Support Command         |  Description                                   | Man Page    |
|-------------------------|------------------------------------------------|-------------|
| get-modules             | Get all or a specific module | [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_modules.md)     |
| networks                | XR Network CRUD management | [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/networks.md)     |
| get-networks            | Get all or a specific XR networks | [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_networks.md)    |
| get-hub-modules         | Get hub module for a specific XR Network |  [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_hub_modules.md)    |
| get-leaf-modules        | Get leaf modules for a specific XR Network | [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_leaf_modules.md)     |
| get-reachable-modules   | Get reachable modules for a specific XR Network | [man page](https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_reachable_modules.md)     |
| tcs                     | Transport capacity CRUD management|  [man page] ()    |
| get-tcs                 | Get all or specific Transport capacities|  [man page] (https://github.com/infinera/terraform-ipm-modules/blob/master/use-cases/man-pages/get_tcs.md)    |
| get-tc_endpoints        | Get Transport capacity's endpoints |  [man page] ()    |
| get-tc_capacity_links   | Get Transport capacity's capacity links |  [man page] ()   |
| ncs                     | Network Connection CRUD management|  TBD    |
| get_ncs                 | Get all or specific Network Connection |  TBD    |
| get_ncs_endpoints       | Get Network Connection's Endpoints |  TBD    |
| get_ncs_lcs       | Get Network Connection's local connections |  TBD    |
| get_ncs_acs       | Get Network Connection's attachment circuits |  TBD    |

## Examples
```
# get all modules
get-modules all init=y

# create network 
networks create init=y intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/network_profiles.json user_profile=/Work-Directory/user-profiles/network_profiles.json

# get all network
get-networks all init=y

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
networks delete intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/network_profiles.json user_profile=/Work-Directory/user-profiles/

# verify that that the network is deleted
get-networks networkId
```

## Trouble Shooting
If terraform **command** fails for any reason, the terraform state file may need to be removed and run "terraform init" again. Execute the command *"networks command init=yes intent=networks.tfvars"*
