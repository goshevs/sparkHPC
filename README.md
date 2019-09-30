# Scripts for running Apache Spark on HPC infrastructure


## Introduction

This repo offers a set of template scripts whose goal is to simplify
running Apache Spark clusters on HPC infrastructure with PBS as a job scheduler. 
It is important to note that the spark configuration that these
scripts set out is customized to serve a specific task. Users should not expect
that this configuration would work well for their problem.

## How to use

Download/clone the repo to a directory and edit the `userInput.template.sh` and
`submit.template.pbs` files. Follow the instructions in each file carefully.
Save `userInput.template.sh` as `userInput.sh` and (if desired save `submit.template.pbs` as 
`submit.pbs`) and then submit the PBS script to the job scheduler on the cluster.

Please, note the following:

1. The script that spark will be executing (i.e. the work script)
accepts arguments. At this time there is only one argument passed to it and that is 
the data file users wish to work with (or anything else users wish to pass!). 

2. In the case of working with sensitive data, users **MUST** ensure that all 
writes to disk by the work script are directed to a directory permissible under the 
DUA/DMP. If uers are unsure what directories they can write to, they should contact
the signee of the DUA/DMP.


## Script specification

The scripts in this repo and their descriptions follow below.

### `userInput.template.sh`

`userInput.template.sh` defines a set of environment variables needed for configuring
the spark cluster. This files **MUST** be customized saved by the users as `userInput.sh`. 
If working with sensitive data, users **MUST** ensure that all files (intermediate and 
final data, log and temp files) are stored in a permissible directory. 

### `submit.template.pbs`

This is the PBS submission script template. Users **MUST** customize it following
the instructions provided in it. Users **MUST** pay specific attention to the instructions 
for working with sensitive data, if this applies to them.

### All other files

All remaning files configure, fire up, pass the work and shut down
the spark cluster if work has completed successfully. **Unless users know 
what they are doing, they should not edit any of them.**


## POSSIBLE ISSUES

One of the most common issues arises from work not completing due to
an error. If this happens, it is very likely that some of the spark processes 
will continue to run on the cluster hosts. This would prevent any 
subsequent launches of spark on these hosts (by the same user) and will 
impact other users by occupying the standard spark master port. The current
version of the sofware addresses both potential issues by:

1. Testing for and if found, shutting down any running spark processes 
started by the same user on a host prior to running a new spark instance

2. Enabling the user to specify a spark master port in `userInput.sh`.

If for some reason the setup scripts fail to address the former issue,
users **MUST** do the following:

1. Identify the hosts that were part of the cluster. Host names are listed
in files `master` and `slaves` in the user selected configuration directory

2. `ssh` to every host and kill the spark processes (users may wish to do this 
with a custom script)

 


