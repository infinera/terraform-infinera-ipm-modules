get_host_ports(1) Version 1.0 

NAME
====

**get_host_ports** — Get Host Ports of a XR network

SYNOPSIS
========

**get_host_ports.sh** hostId


DESCRIPTION
===========

Get the Host Ports of a XR network based on the network's *hostId*. 
The output result is saved in the *workingDirectory*.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| hostId        |  string   |                   | Get the host's port which host id is *hostId*               |

EXAMPLES
===========
Get Host Port(s) for a XR Network
------
```
get_host_ports.sh hostId 
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

AUTHOR
======

Lam Hoang <lhoang@infinera.com>