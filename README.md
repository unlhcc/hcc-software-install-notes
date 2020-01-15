HCC Software Install Notes
==========================

This repository contains notes and scripts for installing software on HCC resources.

How to contribute:
-----------------

The general structure of the repository is `packages/<package name>/<package version>`.
Create directories as needed and create a `README.md` file for each version.
If no special notes are needed, the README file can simply contain the package name and version.
Place the build scripts alongside the README file.

### Script naming

The general naming scheme for the build scripts is:  
`compile.<cluster name>.<compiler name><compiler version>.openmpi<openmpi version>.bash`

The compiler and openmpi version need only be the the same version (excluding dots)
used in the module name.  An example script name is thus `compile.crane.gcc91.openmpi41.bash`.
If code isn't MPI, omit the openmpi part.  If the same script is used on all the clusters,
you can omit the cluster name as well.

### Create a merge request
Create a new branch for any additions, push to Gitlab and open a MR.
Upon merge, the master branch will automatically be synced to Github.
