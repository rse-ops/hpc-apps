# Maestro Hello World

**NOTE this container requires Flux added**

Build the container:

```bash
$ docker build -t demo .
```

Shell in!

```bash
$ docker run -it demo bash
```

We have two examples in "study":

```bash
$ ls study/
```
```console
hello-world-multi-flux.yaml  hello-world-multi.yaml
```

## Hello World without Flux

Let's first run the non Flux workflow to get a sense for Maestro. We use maestro run.

```bash
$ maestro run study/hello-world-multi.yaml
```
It will ask you for a y/n to run the study (this can be forced with `-y`)

```console
[2023-03-23 01:22:48: INFO] INFO Logging Level -- Enabled
[2023-03-23 01:22:48: WARNING] WARNING Logging Level -- Enabled
[2023-03-23 01:22:48: CRITICAL] CRITICAL Logging Level -- Enabled
[2023-03-23 01:22:48: INFO] Loading specification -- path = study/hello-world-multi.yaml
[2023-03-23 01:22:48: INFO] Directory does not exist. Creating directories to /workflow/studies/hello_world/hello_world_multiparam_20230323-012248/logs
[2023-03-23 01:22:48: INFO] Adding step 'hello' to study 'hello_world_multiparam'...
[2023-03-23 01:22:48: INFO] 
------------------------------------------
Submission attempts =       1
Submission restart limit =  1
Submission throttle limit = 0
Use temporary directory =   False
Hash workspaces =           False
Dry run enabled =           False
Output path =               /workflow/studies/hello_world/hello_world_multiparam_20230323-012248
------------------------------------------
Would you like to launch the study? [yn] y
Study launched successfully.
```
It won't hang on the submit. You need to explicitly ask for status, and point
that at the study folder, which will be present now in `studies`:

```bash
root@4423908a5bc7:/workflow# maestro status studies/hello_world/hello_world_multiparam_20230323-012248/
                                                  Study: /workflow/studies/hello_world/hello_world_multiparam_20230323-012248                                                   
┏━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━┳━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┓
┃ Step Name          ┃ Job ID ┃ Workspace         ┃ State    ┃ Run Time       ┃ Elapsed Time   ┃ Start Time         ┃ Submit Time       ┃ End Time           ┃ Number Restarts ┃
┡━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━╇━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━┩
│ hello_GREETING.Hel │ 16     │ hello/GREETING.He │ FINISHED │ 0d:00h:00m:01s │ 0d:00h:00m:01s │ 2023-03-23         │ 2023-03-23        │ 2023-03-23         │ 0               │
│ lo.NAME.Pam        │        │ llo.NAME.Pam      │          │                │                │ 01:22:51           │ 01:22:51          │ 01:22:52           │                 │
│ hello_GREETING.Cia │ 17     │ hello/GREETING.Ci │ FINISHED │ 0d:00h:00m:02s │ 0d:00h:00m:02s │ 2023-03-23         │ 2023-03-23        │ 2023-03-23         │ 0               │
│ o.NAME.Jim         │        │ ao.NAME.Jim       │          │                │                │ 01:22:52           │ 01:22:52          │ 01:22:54           │                 │
│ hello_GREETING.Hey │ 18     │ hello/GREETING.He │ FINISHED │ 0d:00h:00m:01s │ 0d:00h:00m:01s │ 2023-03-23         │ 2023-03-23        │ 2023-03-23         │ 0               │
│ .NAME.Michael      │        │ y.NAME.Michael    │          │                │                │ 01:22:54           │ 01:22:54          │ 01:22:55           │                 │
│ hello_GREETING.Hi. │ 19     │ hello/GREETING.Hi │ FINISHED │ 0d:00h:00m:01s │ 0d:00h:00m:01s │ 2023-03-23         │ 2023-03-23        │ 2023-03-23         │ 0               │
│ NAME.Dwight        │        │ .NAME.Dwight      │          │                │                │ 01:22:55           │ 01:22:55          │ 01:22:56           │                 │
└────────────────────┴────────┴───────────────────┴──────────┴────────────────┴────────────────┴────────────────────┴───────────────────┴────────────────────┴─────────────────┘
```
