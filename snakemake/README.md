# Flux Snakemake Example

This is an example container where you can build (optional) and run
the [Snakemake tutorial workflow](https://snakemake.readthedocs.io/en/stable/tutorial/tutorial.html):

```bash
$ docker build -t snakemake .
```

or with a tag for the restful API:

```bash
$ docker build --no-cache --build-arg app="latest" -t snakemake .
```

