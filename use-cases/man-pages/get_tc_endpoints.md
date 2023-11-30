get_tc_endpoints(1) Version 1.0 

NAME
====

**get_tc_endpoints** — Get all endpoints for a specific Transport Capacity

SYNOPSIS
========

**get_tc_endpoints.sh** TCId 


DESCRIPTION
===========

Get the Transport Capacity'a endpoints based on the specific *TCId*.
The output result is saved in the *workingDirectory*.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| TCId         |  string   | - xyz id              | Get all endpoints for TC which id is *xyz*               |

EXAMPLES
===========

Get Transport Capacities(s)
------
```
get_tc_endpoints.sh TCId 
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====


AUTHOR
======

Lam Hoang <lhoang@infinera.com>