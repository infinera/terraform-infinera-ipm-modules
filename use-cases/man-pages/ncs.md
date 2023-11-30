ncs(1) Version 1.0 

NAME
====

**ncs** — Network Connection CRUD Management

SYNOPSIS
========

**ncs.sh** *command* [intent=intentFileName] [system_profile=systemProfileName] [user_profile=userProfileName] 


DESCRIPTION
===========

Depending on the *command*, the **ncs** function shall create, update, or delete the Network Connection. 


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| command          |  string   | - apply          | Create/Update Network Connection based on the intent               |
|                  |           | - plan          | Plan Network Connection               |
|                  |           | - delete          | Delete Network Connection               |
|                  |           | - init            | Only need at the first execution of the IPM service commands      |
|                  |           | - recover         | copy the saved TF state file back.      |
| [intent=intentFileName] |           |            | intentFileName is the full path file name of the intent. Not required for *delete* command      |
| [system_profile=systemProfileName] |   |         | systemProfileName is the full path file name of the system profile. No required for *delete* command or if the SYSTEM_PROFILE environment variable is set.    |
| [user_profile=userProfileName] |   |         | userProfileName is the full path file name of the user profile. No required for *delete* command or if the USER_PROFILE environment variable is set.    |

EXAMPLES
===========

Get XR Network's Transport Capacities
------
```
get_network_connections.sh all 
get_network_connections.sh id 
```

Create XR Network
------
```
ncs.sh *apply* intent=ncs.tfvars system_profile=ncs_profiles.json
```

Update XR Network
------
After make change in the intent file; enter the command below
```
ncs.sh *apply* intent=ncs.tfvars 
```
Delete XR Network
------
```
ncs.sh *delete* intent=networks.tfvars
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