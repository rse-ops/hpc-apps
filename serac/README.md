# Serac Build

Build the container:

```bash
$ docker build -t serac .
```

Shell in!

```bash
$ docker run -it serac bash
```

You can go to the build location and run tests:

```bash
$ cd /home/serac/build
$ make test
```

or you can run one of the examples (also in that root):

```bash
$ ./examples/simple_conduction_with_input_file 
```
```console
Logger activated: 'serac_serial_logger'
Saving data collection at time: '0' to path: 'with_input_file_example/default_datacoll'
Newton iteration  0 : ||r|| = 3.9444
Newton iteration  1 : ||r|| = 3.19523e-06, ||r||/||r_0|| = 8.10069e-07
Saving data collection at time: '4.658341841263e-310' to path: 'with_input_file_example/default_datacoll'
```
```bash
serac@1f178b56c3a4:~/build$ ./examples/simple_conduction_without_input_file 
```
```console
Logger activated: 'serac_serial_logger'
Saving data collection at time: '0' to path: 'without_input_file_example/default_datacoll'
Newton iteration  0 : ||r|| = 3.9444
Newton iteration  1 : ||r|| = 3.19523e-06, ||r||/||r_0|| = 8.10069e-07
Saving data collection at time: '4.6668805272782e-310' to path: 'without_input_file_example/default_datacoll'
```
