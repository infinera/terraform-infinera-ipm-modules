get-hub-module(1) Version 1.0 

NAME
====

**get-hub-module** — Get XR hub module of a XR network

SYNOPSIS
========

**get-hub-module** networkId *[init=y|yes]*


DESCRIPTION
===========

Get the XR hub module of a XR network based on its *networkId*. 


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| networkId        |  string   |                   | Get the XR hub module of a XR network which is is *networkId*               |
| *[init=y\|yes]*  |           |                   | Only need at the first execution the IPM service commands      |

EXAMPLES
===========

Get XR Hub Module(s) for a XR Network
------

1. get-hub-module networkId init=y
2. get-hub-module networkId

ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

If the command fails, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>