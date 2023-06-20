get-reachable-modules(1) Version 1.0 

NAME
====

**get_reachable_modules** — Get XR reachable modules of a XR network

SYNOPSIS
========

**get_reachable_modules** networkId *[init=y|yes]*


DESCRIPTION
===========

Get the XR reachable modules of a XR network based on the network's *networkId*. 


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| networkId        |  string   |                   | Get the XR reachable module of a XR network which is is *networkId*               |
| *[init=y\|yes]*  |           |                   | Only need at the first execution the IPM service commands      |

EXAMPLES
===========

Get XR Reachable Module(s) for a XR Network
------

1. get_reachable_modules networkId *[init=y|yes]*

ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

If the command fails, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>