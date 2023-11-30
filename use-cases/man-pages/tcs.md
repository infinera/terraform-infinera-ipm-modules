tcs(1) Version 1.0 

NAME
====

**tcs** — Transport Capacity CRUD Management

SYNOPSIS
========

**tcs.sh** *command* [intent=intentFileName] [system_profile=systemProfileName] [user_profile=userProfileName] 


DESCRIPTION
===========

Depending on the *command*, the **tcs** function shall create, update, or delete the Transport Capacity.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| command          |  string   | - apply          | Create/Update Transport Capacity based on the intent               |
|                  |           | - plan          | Plan Transport Capacity               |
|                  |           | - delete          | Delete Transport Capacity               |
|                  |           | - init            | Only need at the first execution of the IPM service commands      |
|                  |           | - recover         | copy the saved TF state file back.      |
| [intent=intentFileName] |           |            | intentFileName is the full path file name of the intent. Not required for *delete* command      |
| [system_profile=systemProfileName] |   |         | systemProfileName is the full path file name of the system profile. No required for *delete* command or if the SYSTEM_PROFILE environment variable is set.    |
| [user_profile=userProfileName] |   |         | userProfileName is the full path file name of the user profile. No required for *delete* command or if the USER_PROFILE environment variable is set.    |

EXAMPLES
===========

Get Transport Capacities
------

1. get_transport_capacities.sh all
2. get_transport_capacities.sh id

Create Transport Capacities
------
```
tcs.sh *apply* intent=tcs.tfvars
```
Update XR Network
------
After make change in the intent file; enter the command below
```
tcs.sh *apply* intent=tcs.tfvars system_profile=tcs_profiles.json
```
Delete XR Network
-----
```
tcs.sh delete intent=networks.tfvars
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