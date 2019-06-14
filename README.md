# pgx_docker
## Build

1. Download pgx-server binary from [OTN](https://www.oracle.com/technetwork/oracle-labs/parallel-graph-analytix/downloads/downloads-2206142.html) to current directory.

2. Docker build

```
$ docker build -t pgx:latest .

# If you want to use other than PGX 19.2, you must set --build-arg version=x.x.x

$ docker build -t pgx:3.2.0 . --build-arg version=3.2.0
```

