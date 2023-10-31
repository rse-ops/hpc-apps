# Weave Demos

This is an example container where you can build (optional) and run
the [weave demos](https://github.com/LLNL/weave-demos), specifically
to simualte bouncing a ball.

```bash
$ docker build -t demos .
```

Then shell inside

```bash
$ docker run --entrypoint bash -it demos 
```

## Manual Run

To run the tutorial as is (without Flux) do:

```bash
# The "y" says yes to prompts
$ maestro run ball_bounce_suite.yaml --pgen pgen.py -y
```

Output will appear in "output" and you can dig into the subdirectory to find logs:

```bash
$ cat output/ball-bounce_20230315-035713/logs/ball-bounce.log 
```
```console
...
2023-03-15 03:57:22,708 - maestrowf.datastructures.core.executiongraph:_execute_record:584 - INFO - Attempting submission of 'run-ball-bounce_BOX_SIDE_LENGTH.100.GRAVITY.0.5.GROUP_ID.8d0688.RUN_ID.7.X_POS_INITIAL.45.X_VEL_INITIAL.-2.Y_POS_INITIAL.37.Y_VEL_INITIAL.8.Z_POS_INITIAL.19.Z_VEL_INITIAL.-1' (attempt 1 of 1)...
2023-03-15 03:57:22,775 - maestrowf.interfaces.script.localscriptadapter:submit:151 - INFO - Execution returned status OK.
```
The last line should say it returned OK and shouldn't say FAILED! I found the output directories (length!) a little overwhelming to browse, so I installed and used tree:

```bash
$ apt-get update && apt-get install -y tree
$ tree output/*/run-ball-bounce/
```
```console
└── BOX_SIDE_LENGTH.100.GRAVITY.0.5.GROUP_ID.8d0688.RUN_ID.9.X_POS_INITIAL.45.X_VEL_INITIAL.7.Y_POS_INITIAL.37.Y_VEL_INITIAL.-6.Z_POS_INITIAL.19.Z_VEL_INITIAL.-2
    ├── output.dsv
    ├── run-ball-bounce_BOX_SIDE_LENGTH.100.GRAVITY.0.5.GROUP_ID.8d0688.RUN_ID.9.X_POS_INITIAL.45.X_VEL_INITIAL.7.Y_POS_INITIAL.37.Y_VEL_INITIAL.-6.Z_POS_INITIAL.19.Z_VEL_INITIAL.-2.33.err
    ├── run-ball-bounce_BOX_SIDE_LENGTH.100.GRAVITY.0.5.GROUP_ID.8d0688.RUN_ID.9.X_POS_INITIAL.45.X_VEL_INITIAL.7.Y_POS_INITIAL.37.Y_VEL_INITIAL.-6.Z_POS_INITIAL.19.Z_VEL_INITIAL.-2.33.out
    └── run-ball-bounce_BOX_SIDE_LENGTH.100.GRAVITY.0.5.GROUP_ID.8d0688.RUN_ID.9.X_POS_INITIAL.45.X_VEL_INITIAL.7.Y_POS_INITIAL.37.Y_VEL_INITIAL.-6.Z_POS_INITIAL.19.Z_VEL_INITIAL.-2.sh
```
It looks like each directory has a script, and output, and an error file. I found the output/error to be empty, but the `output.dsv` is some kind of matric of numbers, and the submit script
(the shell script) is just a single line:

```
#!/bin/bash

python /workflow/ball_bounce/./ball_bounce.py output.dsv 45 37 19 -3 3 1 0.5 100 8d0688 2
```

This is probably what they mean when they say running a single simulation. That command runs one simulation. For
fun, I tried this on my own:

```bash
$ mkdir test
$ cd test
$ python /workflow/ball_bounce/./ball_bounce.py output.dsv 45 37 19 -3 3 1 0.5 100 8d0688 2
```

It generated an output.dsv almost immediately. We could likely adjust the simulation parameters for the calculation.
