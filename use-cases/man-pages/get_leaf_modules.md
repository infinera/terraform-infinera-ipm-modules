get-leaf-modules(1) Version 1.0 

NAME
====

**get-leaf-modules** — Get XR leaf modules of a XR network

SYNOPSIS
========

**get-leaf-modules** networkId *[init=y|yes]*


DESCRIPTION
===========

Get the XR leaf modules of a XR network based on the network's *networkId*. 


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| networkId        |  string   |                   | Get the XR leaf module of a XR network which *networkId* is *xyz*               |
| *[init=y\|yes]*  |           |                   | Only need at the first execution the IPM service commands      |

EXAMPLES
===========

Get XR Leaf Module(s) for a XR Network
------

1. get-leaf-modules networkId init=y
2. get-leaf-modules networkId

ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

If the command fails, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>