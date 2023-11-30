get_carriers(1) Version 1.0 

NAME
====

**get_carriers** — Get XR leaf modules of a XR network

SYNOPSIS
========

**get_carriers.sh** module_id line_ptp_col_id [carrier_col_id]



DESCRIPTION
===========

Get the XR leaf modules of a XR network based on the network's *networkId*. 
The output result is saved in the *workingDirectory*.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| module_id        |  string   |                   | Module ID              |
| line_ptp_col_id        |  string   |                   | Line PTP Collection ID              |
| carrier_col_id        |  string   |                   | Optional Line PTP Collection ID. If this parameter is not set, get all for the parent           |

EXAMPLES
===========
Get all carriers for a Module's Line PTP 
------
```
get_carriers.sh module_id line_ptp_col_id 
```

Get specific carrier of a Module's Line PTP 
------
```
get_carriers.sh module_id line_ptp_col_id carrier_col_id
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

AUTHOR
======

Lam Hoang <lhoang@infinera.com>