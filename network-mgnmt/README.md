# Constellation Network 
The user can create one or more constellation networks by specify the desired intent for the networks and their leaf modules.

# Prerequisite
1. The "infinera.com/poc/ipm" provider is accessible from infinera repository
2. Terraform (Install terraform via https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
3. IPM server credentials: Define the following environment variables: TF_VAR_ipm_user, TF_VAR_ipm_password, and TF_VAR_ipm_host. 
4. If it is required, the user defined Constellation Network profiles.json must be available in the TF root directory (where the command "terraform apply" is executed)

# Create Constellation Network With No Leaf 
## Steps
1. Create new **ABC** directory go to existing **ABC** directory
2. Copy files *variables.tf*, *main.tf*, *profiles.json* and input file *network.tfvars* (these files are shown Details.md) to directory **ABC**
3. Update intent file *network.tfvars* as needed
4. Execute command *terraform init*
5. Then Execute command *terraform apply -var-file=network.tfvars*

## *network.tfvars* Network Intent File
```
networks = [{name= "XR Network1", 
             profile = "network_profile1",  
             hub_module = { identifier = {name = "PORT_MODE_HUB"}}}]
```
***Created "XR Network1" Network**
```
XR Network1  (hub=PORT_MODE_HUB)
```

# Create Constellation Network With One Leaf
## Steps
1. Update intent file *network.tfvars* to add the leaf module
2. Then Execute command *terraform apply -var-file=network.tfvars*

## Modified *network.tfvars* Network Intent File
<pre>
networks = [{name= "XR Network1", 
             profile = "network_profile1",  
             hub_module = { identifier = {name = "PORT_MODE_HUB"} },
             <b>leaf_modules = [{ identifier = {name = "PORT_MODE-LEAF1"}}]</b>
            }]
</pre>

*New Leaf "PORT_MODE_LEAF1" is added to "XR Network1" XR Network*
```
XR Network1  (hub=PORT_MODE_HUB)-------------|-----> leaf 1 = PORT_MODE_LEAF1

```
# Add New Leaf Modules to Constellation Network
## Steps
1. Update intent file *network.tfvars* to add two more leaf modules
2. Then Execute command *terraform apply -var-file=network.tfvars*

## Modified *network.tfvars* Network Intent File
<pre>
networks = [{name= "XR Network1", 
             profile = "network_profile1",  
             hub_module = { identifier = {name = "PORT_MODE_HUB"} },
             leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}},
                            <b>{identifier =  {name = "PORT_MODE_LEAF2"}}</b>,
                            <b>{identifier = {name = "PORT_MODE_LEAF3"}}</b>],
            }]
</pre>

*New Leaf "PORT_MODE_LEAF1" is added to "XR Network1" XR Network*
```
XR Network1  (hub=PORT_MODE_HUB)-------------|-----> leaf 1 = PORT_MODE_LEAF1
                                             |
                                             |-----> leaf2 = PORT_MODE_LEAF2
                                             |
                                             |-----> leaf3 = PORT_MODE_LEAF1
```

# Remove Leaf Modules From The Created XR Network
## Steps
1. Update intent file *network.tfvars* to add two more leaf modules
2. Then Execute command *terraform apply -var-file=network.tfvars*

## Modified *network.tfvars* Network Intent File
<pre>
networks = [{name= "XR Network1", 
             profile = "network_profile1",  
             hub_module = { identifier = {name = "PORT_MODE_HUB"} },
             leaf_modules=[<s>{identifier =  {name = "PORT_MODE_LEAF2"}},</s>
                            {identifier =  {name = "PORT_MODE_LEAF2"}},
                            <s>{identifier = {name = "PORT_MODE_LEAF3"}}</s>]
            }]
</pre>

*Two Leaf Modules "PORT_MODE_LEAF1" and "PORT_MODE_LEAF3" are removed from "XR Network1" XR Network*
```
XR Network1  (hub=PORT_MODE_HUB)-------------|-----> leaf 1 = PORT_MODE_LEAF2
```

# Update The Configuration Settings For the XR Network and all its Modules
## Steps
1. Update intent file *network.tfvars* to add two more leaf modules
2. Then Execute command *terraform apply -var-file=network.tfvars*

## Modified *network.tfvars* Network Intent File
<pre>
  networks = [{name= "XR Network1", 
                network_profile = <b>"network_profile2"</b>, 
                hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF2"}}]}]
</pre>
*The network, its hub, its leaf modules's configurations are updated using the network profile "network_profile2"*

# Update The Configuration Settings for the XR Network Only
1. Update intent file *network.tfvars* to add two more leaf modules
2. Then Execute command *terraform apply -var-file=network.tfvars*

## Modified *network.tfvars* Network Intent File
<pre>
  networks = [{name= "XR Network1", 
                network_profile = "network_profile2", 
               <b>constellation_frequency= 193000, modulation = "16QAM", managed_by="cm", tc_mode=true</b>,
                hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF2"}}]}]
</pre>
*The network "Network1" configuration shall be updated with the specified attribute/value settings.*

# Update The Configuration Settings for the Hub Module of an XR Network
1. Update intent file *network.tfvars* to add two more leaf modules
2. Then Execute command *terraform apply -var-file=network.tfvars*

## Modified *network.tfvars* Network Intent File
<pre>
  networks = [{name= "XR Network1", 
                network_profile = "network_profile2", 
                hub_module = { identifier = {name = "PORT_MODE_HUB"},
                               <b>traffic_mode: "L1Mode",fiber_connection_mode: "single"", managed_by: "cm"", planned_capacity: "400G",
                                requested_nominal_psd_offset: "+3dB", fec_iterations: "standard", tx_clp_target: -3500</b>}, 
                leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF2"}}]}]
</pre>
*The hub module's configuration of the network "Network1" shall be updated with the specified attribute/value settings.*

# Update The Configuration Settings for the Leaf Modules of an XR Network
1. Update intent file *network.tfvars* to add two more leaf modules
2. Then Execute command *terraform apply -var-file=network.tfvars*

## Modified *network.tfvars* Network Intent File
<pre>
  networks = [{name= "XR Network1", 
                network_profile = "network_profile2", 
                hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}, <b>
                               config_profile = "leaf_profile2"</b>},
                               {identifier =  {name = "PORT_MODE_LEAF2"}, 
                               <b>traffic_mode: "L1Mode",fiber_connection_mode: "single"", managed_by: "cm"", planned_capacity: "400G",
                                requested_nominal_psd_offset: "+3dB", fec_iterations: "standard", tx_clp_target: -3500</b>}]}]
</pre>
*The leaf modules' configurations of the network "Network1" shall be updated with the specified attribute/value settings.*
  * The leaf module "PORT_MODE_LEAF1" configuration shall be updated using the **config_profile** specifications.
  * The leaf module "PORT_MODE_LEAF2" configuration shall be updated using the **config** specifications.

**Please see Network Detail README for more information**
