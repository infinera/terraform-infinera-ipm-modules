tcs(1) Version 1.0 

NAME
====

**tcs** — Transport Capacity CRUD Management

SYNOPSIS
========

**tcs** *command* *[init=y|yes]* [intent=intentFileName] [system_profile=systemProfileName] [user_profile=userProfileName] 


DESCRIPTION
===========

Depending on the *command*, the **tcs** function shall create, update, or delete the Transport Capacity.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| command          |  string   | - create          | Create Network based on the intent               |
|                  |           | - update          | Update Network based on the updated intent               |
|                  |           | - plan          | Plan Network                |
|                  |           | - delete          | Delete Network                |
| *[init=y\|yes]*  |           |                   | Only need at the first execution of the IPM service commands      |
| [intent=intentFileName] |           |            | intentFileName is the full path file name of the intent. Not required for *delete* command      |
| [system_profile=systemProfileName] |   |         | systemProfileName is the full path file name of the system profile. No required for *delete* command or if the SYSTEM_PROFILE environment variable is set.    |
| [user_profile=userProfileName] |   |         | userProfileName is the full path file name of the user profile. No required for *delete* command or if the USER_PROFILE environment variable is set.    |

EXAMPLES
===========

Get Transport Capacities
------

1. get-tcs all
2. get-tcs id

Create Transport Capacities
------
```
tcs create *[init=y | yes]* intent=/Work-Directory/user-intents/tcs.tfvars system_profile=/Work-Directory/system_profiles/tcs_profiles.json user_profile=/Work-Directory/user-profiles/tcs.json
```
Update XR Network
------
```
tcs update intent=/Work-Directory/user-intents/tcs.tfvars system_profile=/Work-Directory/system_profiles/tcs_profiles.json user_profile=/Work-Directory/user-profiles/tcs_profiles.json
```
Delete XR Network
-----
```
tcs delete intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/tcs_profiles.json user_profile=/Work-Directory/user-profiles/tcs_profiles.json
```
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