get_acs(1) Version 1.0 

NAME
====

**get_acs** — Get XR leaf modules of a XR network

SYNOPSIS
========

**get_acs.sh** module_id eclient_col_id [ac_col_id]



DESCRIPTION
===========

Get the XR leaf modules of a XR network based on the network's *networkId*. 
The output result is saved in the *workingDirectory*.

Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| module_id        |  string   |                   | Module ID              |
| eclient_col_id        |  string   |                   | Ethernet Client Collection ID              |
| ac_col_id        |  string   |                   | Optional AC Collection ID. If this parameter is not set, get all for the parent           |

EXAMPLES
===========
Get all AC for a Module's ethernet client 
------
```
get_acs.sh module_id eclient_col_id 
```

Get specific AC of a Module's ethernet client 
------
```
get_acs.sh module_id eclient_col_id ac_col_id
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

AUTHOR
======

Lam Hoang <lhoang@infinera.com>