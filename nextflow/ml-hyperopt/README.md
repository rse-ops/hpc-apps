# Flux Nextflow Example

This is an example container where you can build (optional) and run
the [Nextflow Machine Learning](https://github.com/nextflow-io/ml-hyperopt) tutorial:

```bash
$ docker build -t nextflow .
```

or with a tag for the restful API:

```bash
$ docker build --no-cache --build-arg app="latest" -t nextflow .
```

Note that we tweak the [nextflow.config](nextflow.config) so that it runs with
Flux. If you get an error, you likely can grab the [latest from the repository](https://github.com/nextflow-io/ml-hyperopt/blob/master/nextflow.config) and be sure to add a profile for Flux:

```
profiles {
...
    flux {
        process.executor = 'flux'
        process.conda = "$baseDir/conda.yml"
        flux {
            terminalOutput = true
        }
    }
```

Note that `process.terminalOutput = true` is needed for flux to be able to see the log output!

## Running the Workflow

Note that you'll need flux to use flux, otherwise use another profile.

```bash
$ cd /workflow
$ nextflow -c nextflow.config run main.nf -profile flux
```
