# Constellation Network 
The user can create one or more constellation networks by specify the desired intent for the networks and their modules.
Basically for any network configurations, There are two required data : the intent and the configuration profiles.
* The configuration Intent are specified by user to create, retrieve, update and delete the network.
* The configuration Profiles are defined once and they include both system defined and user define configuration settings. Please refer to the [Detail Readme](https://github.com/infinera/terraform-ipm_modules/blob/master/network-mgnmt/Intent%20and%20Profiles.md) for more information.

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
The *XR Network1* network shall be created with hub module *PORT_MODE_HUB* and one leaf module *PORT_MODE-LEAF1*. For more information about the intent specification, please refer to the [Intent Specification](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Intent.md)

*The profile **network_profile1** specifies the system or user defined network configuration settings. For more information about profiles specification and their usages, please refer to the [Profile Specification](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Profiles.md)*

# [Uses Cases](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Use%20Cases.md)