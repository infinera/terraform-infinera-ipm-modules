# XR Network Quick Start
## Preconditions:
1. IPM Service Docker Image. Please see [IPM Services Docker Image and Container](https://bitbucket.infinera.com/projects/MAR/repos/terraform-provider-ipm/browse/IPM%20Services%20Docker%20Image%20and%20Container.md)
2. Intent Files. Please see [Intent Definition](https://github.com/infinera/terraform-ipm-modules/blob/master/network-service/Intent.md) for more details.
3. User Profile files if needed. Please see [User Profile Files](https://github.com/infinera/terraform-ipm-modules/blob/master/network-service/Profiles.md) for  more details.

## Procedures
1. Bring up the docker container in desired working directory by executing this command *'docker run -it -v "$(pwd)":/Work-Directory --add-host=pt-xrivk824-dv:10.46.76.81 sv-artifactory.infinera.com/marvel/ipm/ipm-services:v0.0.1 bash'*. 
2. Now in the container's bash shell, execute the command *". setup.sh network1"*. The *network1* directory will be created as needed together with its user-intents and user-profiles subdirectories in the host volume */Work-Directory*. 
   1. These subdirectories are populated with sample intents and user profiles. The user can copy and/or create new intent or user profile files to be used in the management of the  XR network. The user profile name for network service (by convention) must be *"network-profiles.json"* ( similarly, *"nc-profiles.json"* for Network Connection service, *"tc-profiles.json"* for Traffic Capacity service, etc.) 
   2. Notice that the */Work-Directory* is the container volume which is mapped to the host *$(pwd)* directory; hence the user can add, update, save, or removed any user intents and user profiles in the host directly without the need to rebuild the container image or rerun the container.
3. **View all modules in the XR Networks**. Execute the command *"get-modules $1 init=yes"*. If the execution is success, it shall generate *get-modules-output.json* file at */Work-Directory/network1*.
4. **Manage Constellation Network**. Execute the command *"networks command init=yes intent=networks.tfvars"*. (**Notice The option *init=yes* only require the first time execution**.) 
   1. The *networks.tfvars* intent file must existed in the */Work-Directory/network1/user-intents* directory. 
   2. The support *commands* are
      1. create: If the execution is success, it shall generate *networks-output.json* file at */Work-Directory/network1*.
      2. update: If the execution is success, it shall generate *networks-output.json* file at */Work-Directory/network1*. Just update the intent file to update.
      3. plan: If the execution is success, it shall generate *networks-plan.json* file at */Work-Directory/network1*.
      4. delete: 
   3. If the command is success, 
5. **View Hub Module of the XR Network**. Execute the command *"get-hub-modules network_id init=yes"*. If the execution is success, it shall generate *get-hub-modules-output.json* file at */Work-Directory/network1*. (*init=yes* option is only needed at the first run.)
6. **View Leaf Modules of the XR Network**. Execute the command *"get-leaf-modules network_id init=yes"*. If the execution is success, it shall generate *get-leaf-modules-output.json* file at */Work-Directory/network1*. (*init=yes* option is only needed at the first run.)
7. **View Reachable Modules of the XR Network**. Execute the command *"get-reachable-modules network_id init=yes"*. If the execution is success, it shall generate *get-reachable-modules-output.json* file at */Work-Directory/network1*. (*init=yes* option is only needed at the first run.)

## Trouble Shooting
1. If terraform **command** fails for any reason, the terraform state file may need to be removed and run "terraform init" again. Execute the command *"networks command init=yes intent=networks.tfvars"*
