# Setup

Ensure you have [docker](https://docker.io) and [docker-compose](https://docs.docker.com/compose/)
installed.

# Running Examples

## With Docker (recommended)

To run unit tests, just execute

```
docker-compose up greeting
```

# Without docker

First open [`init.sh`](./init.sh) and [`watch.sh`](./watch.sh) and change the `PROJDIR` environment variable to `${DIR}`.

```diff
- PROJ_DIR=/greeting
+ PROJ_DIR=${DIR}
```

Ensure you have cmake and entr installed (and a C++ compiler, of course).

Then run

```
./watch.sh
```

As you edit the source code the project should compile automatically.
