get_ncs(1) Version 1.0 

NAME
====

**get_network_connections** — Get all or specific Transport Capacity

SYNOPSIS
========

**get_network_connections.sh** id 


DESCRIPTION
===========

Get the XR network's network connections based on its *Id*. If the *Id* is **all**, get all Transport Capacities in the XR networks.
The output result is saved in the *workingDirectory*.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| id         |  string   | - all             | Get all Transport Capacities               |
|                  |           | - xyz id          | Get the Transport Capacity which id is *xyz*               |

EXAMPLES
===========
Get Network Connections
------
```
get_network_connections.sh all 
get_network_connections.sh id 
```
ENVIRONMENT
===========

None

AUTHOR
======

Lam Hoang <lhoang@infinera.com>