get-networks(1) Version 1.0 

NAME
====

**get_tcs** — Get all or specific Transport Capacity

SYNOPSIS
========

**get_tcs** id *[init=y|yes]*


DESCRIPTION
===========

Get the XR network's Transport Capacity based on its *Id*. If the *Id* is **all**, get all Transport Capacities in the XR networks.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| id         |  string   | - all             | Get all Transport Capacities               |
|                  |           | - xyz id          | Get the Transport Capacity which id is *xyz*               |
| *[init=y|yes]*    |           |                   | Only need at the first execution the IPM service commands      |

EXAMPLES
===========

Get Transport Capacities(s)
------

1. get-tcs all *[init=y|yes]*
2. get-tcs id *[init=y|yes]*

ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

If the command fails, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>