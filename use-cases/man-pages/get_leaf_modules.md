get_leaf_modules(1) Version 1.0 

NAME
====

**get_leaf_modules** — Get XR leaf modules of a XR network

SYNOPSIS
========

**get_leaf_modules.sh** networkId


DESCRIPTION
===========

Get the XR leaf modules of a XR network based on the network's *networkId*. 
The output result is saved in the *workingDirectory*.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| networkId        |  string   |                   | Get the XR leaf modules of a XR network which network id is *networkId*               |

EXAMPLES
===========
Get XR Leaf Module(s) for a XR Network
------
```
get_leaf_modules.sh networkId 
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====



AUTHOR
======

Lam Hoang <lhoang@infinera.com>