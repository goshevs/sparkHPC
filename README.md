# Scripts for running Apache Spark on HPC infrastructure


## Introduction

This repo offers a set of template scripts whose goal is to simplify
running Apache Spark clusters on certain HPC infrastructure. It is 
important to note that the spark configuration that these
scripts set out is customized to serve a specific task. You should not expect
that this configuration would work well for your problem.

## How to use

Download/clone the repo to a directory and edit the `EDITME.sh` and
`submit.pbs` files. Follow the instructions in each file carefully.
Then submit `submit.pbs` to the job scheduler on the cluster.

Please, note the following:

1. The script that spark will be executing (i.e. your work script)
accepts arguments. At this time there is only one argument passed to it and that is 
the data file you wish to work with (or anything else you wish to pass!). 

2. In the case of working with sensitive data, ensure that all writes to disk 
in your work script are directed to a directory permissible under the 
DUA/DMP. If you are unsure what directories you can write to, contact
the signee of the DUA/DMP.


## Script specification

The scripts in this repo and their descriptions follow below.

### `EDITME.sh`

`EDITME.sh` defines a set of environmental variables needed for configuring
the spark cluster. This files **MUST** be customized by the user. 
If working with sensitive data, the user **MUST** ensure that all files
(intermediate and final data, log and temp files) are stored in a permissible 
directory. 

### `submit.pbs`

This is the PBS submission script. The user **MUST** customize it following
the instructions provided in it. The user **MUST** pay specific attention to the instructions 
for working with sensitive data, if this applies to them.

### All other files

All remaning files configure, fire up, pass the work and shut down
the spark cluster if work has completed successfully. **Unless you know 
what you are doing, please do not edit any of them.**


## POSSIBLE ISSUES

One of the most common issues arises from work not completing due to
an error. If this happens, it is very likely that some of the spark processess 
will continue to run on the cluster hosts. This would prevent any 
subsequent launches of spark on these hosts (by the same users) and will 
impact other users by occupying the standard spark port (this is something 
future versions of this code will look to mitigate). Therefore, if the work 
script crashes, the user **MUST** do the following:

1. Identify the hosts that were part of the cluster. Host names are listed
in files `master` and `slaves` in the user selected configuration directory

2. `ssh` to every host and kill the spark processes (user may wish to write
a custom code to that)

 


