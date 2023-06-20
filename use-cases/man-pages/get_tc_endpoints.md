get-networks(1) Version 1.0 

NAME
====

**get_tc_endpoints** — Get all endpoints for a specific Transport Capacity

SYNOPSIS
========

**get_tc_endpoints** TCId *[init=y|yes]*


DESCRIPTION
===========

Get the Transport Capacity'a endpoints based on the specific *TCId*.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| TCId         |  string   | - xyz id              | Get all endpoints for TC which id is *xyz*               |
| *[init=y|yes]*    |           |                   | Only need at the first execution the IPM service commands      |

EXAMPLES
===========

Get Transport Capacities(s)
------

1. get_tc_endpoints TCId *[init=y|yes]*

ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

If the command fails, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>