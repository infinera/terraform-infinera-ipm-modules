# Constellation Network 
The user can create one or more constellation networks by specify the desired intent for the networks and their modules.
Basically for any network configurations, There are two required data : the intent and the configuration profiles.
* The configuration Intent are specified by user to create, retrieve, update and delete the network.
* The configuration Profiles are defined once and they include both system defined and user define configuration settings. Please refer to the [Detail Readme](https://github.com/infinera/terraform-ipm_modules/blob/master/network-mgnmt/Intent%20and%20Profiles.md) for more information.

## Manage the XR Network via Configuration Intent and IPM Service Docker Image
Please see [Manage the XR Network via Configuration Intent and IPM Service Docker Image](https://bitbucket.infinera.com/projects/MAR/repos/terraform-provider-ipm/browse/README.md) for more details.

## Prerequisite For All Use Cases
1. The Infinera IPM provider
2. Installed Terraform (Install terraform via https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
3. IPM server credentials: Define the following environment variables: TF_VAR_ipm_user, TF_VAR_ipm_password, and TF_VAR_ipm_host. 
4. Accessible to git hub

## Quick Start
1. Copy the directory [*networks*](https://github.com/infinera/terraform-ipm_modules/tree/master/network-service/use-cases/networks) to your working directory.
2. Create the intent (template) file *ABC.tfvars* as shown below.
```
networks = [{network_name= "XR Network1", 
             profile = "network_profile1",  
             hub_module = { identifier = {module_name = "PORT_MODE_HUB"}},
             leaf_modules = [{ identifier = {module_name = "PORT_MODE-LEAF1"}}]}]
```
3. In the working directory, if this is the first run, run **terraform init** to initialize and load Terraform IPM modules.
4. Run **terraform apply -var-file="*ABC.tfvars*"**. 
## Results
The *XR Network1* network shall be created with hub module *PORT_MODE_HUB* and one leaf module *PORT_MODE-LEAF1*. For more information about the intent specification, please refer to the [Intents and Usages](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Intent.md)

*The profile **network_profile1** specifies the system or user defined network configuration settings. For more information about profiles specification and their usages, please refer to the [Profiles and Usages](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Profiles.md)*

# Uses Cases
More use cases are described in the [Uses Cases](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Use%20Cases.md)

# Roles
## Network Designer
The network designer shall create the templates for the desired networks by defining the network intents and their profiles. These template shall be used by the network operators to create common or custom constellation networks across one or multiple regions.
Please refer to the [Intents and Usages](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Intent.md) and [Profiles and Usages](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Profiles.md) links above for more details.
## Network Operator
The network operators shall execute the specified network intent template to create and/or manage the network. As needed they can customize the network settings by overriding the profiles' settings. Please refer to the **Profiles and Usages** links above for more details.
