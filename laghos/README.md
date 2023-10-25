# Laghos Demos

Build the container:

```bash
$ docker build -t demo .
```

Shell in!

```bash
$ docker run -it demo bash
```

Then go to the Laghos install location, run the tests. Note that this is intended
to be paired with flux (but likely you can use mpirun or similar).

```bash
$ flux start --test-size=4
$ cd /workflow/Laghos 
$ flux run make tests
```
