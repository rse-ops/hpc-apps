# HPC Apps

This is a repository of sibling applications to [Flux HPC](https://github.com/rse-ops/flux-hpc)
that are not installed alongside Flux, the use case being that we can run them as containers
within the Flux operator (e.g., Singularity).

The builds are done via [this workflow](.github/workflows/build-matrices.yaml)
that uses [uptodate](https://github.com/vsoch/uptodate) on changed files.
Automated builds for each subdirectory is provided, and these examples
are intending to be ported to be run with the Flux Operator.


License
-------

Copyright (c) 2017-2023, Lawrence Livermore National Security, LLC. 
Produced at the Lawrence Livermore National Laboratory.

RADIUSS Docker is licensed under the MIT license [LICENSE](./LICENSE).

Copyrights and patents in the RADIUSS Docker project are retained by
contributors. No copyright assignment is required to contribute to RADIUSS
Docker.

This work was produced under the auspices of the U.S. Department of
Energy by Lawrence Livermore National Laboratory under Contract
DE-AC52-07NA27344.
