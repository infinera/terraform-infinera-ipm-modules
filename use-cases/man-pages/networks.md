networks(1) Version 1.0 

NAME
====

**networks** — XR Network Management CRUD Management

SYNOPSIS
========

**networks** *command* *[init=y|yes]* [intent=intentFileName] [system_profile=systemProfileName] [user_profile=userProfileName] 


DESCRIPTION
===========

Depending on the *command*, the **networks** function shall create, update, or delete the XR network.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| command          |  string   | - create          | Create Network based on the intent               |
|                  |           | - update          | Update Network based on the updated intent               |
|                  |           | - delete          | Delete Network                |
| *[init=y\|yes]*  |           |                   | Only need at the first execution of the IPM service commands      |
| [intent=intentFileName] |           |            | intentFileName is the full path file name of the intent. Not required for *delete* command      |
| [system_profile=systemProfileName] |   |         | systemProfileName is the full path file name of the system profile. No required for *delete* command or if the SYSTEM_PROFILE environment variable is set.    |
| [user_profile=userProfileName] |   |         | userProfileName is the full path file name of the user profile. No required for *delete* command or if the USER_PROFILE environment variable is set.    |

EXAMPLES
===========

Get XR Network
------

1. get-networks all init=y
2. get-networks all 
3. get-networks networkId

Create XR Network
------

1. networks create init=y intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/network_profiles.json user_profile=/Work-Directory/user-profiles/network_profiles.json
2. networks create intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/network_profiles.json user_profile=/Work-Directory/user-profiles/network_profiles.json

Update XR Network
------

1. networks update intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/network_profiles.json user_profile=/Work-Directory/user-profiles/network_profiles.json

Delete XR Network
------

1. networks delete intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/network_profiles.json user_profile=/Work-Directory/user-profiles/network_profiles.json

ENVIRONMENT
===========

1. SYSTEM_PROFILE. It is used if the command argument *system_profile* is not set.
2. USER_PROFILE. It is used if the command argument *user_profile* is not set.


TROUBLE SHOOTING
====

If the command keeps failing, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>