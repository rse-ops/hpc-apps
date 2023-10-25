# Molecular Design with Parsl

This example workflow will walk you through running the 
the [EXAWorks Molecular Design Demo](https://github.com/ExaWorks/molecular-design-parsl-demo)
using Parsl and Flux. We have adopted the first script to be run from the command line instead
of notebooks. Also, the columna integration does not seem to work, so we only
provide the first workflow as an example. First, build the container:

```bash
$ docker build -t mdparsl .
```

And shell inside:

```bash
$ docker run -it --rm --name mdparsl mdparsl
```

You'll need Flux added to this container to run the example.
