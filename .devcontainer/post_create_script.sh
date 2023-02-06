#!/bin/bash

docker pull quay.io/minio/minio
docker tag quay.io/minio/minio:latest minio:latest
docker run -dt                                  \
  -p 9000:9000 -p 9090:9090                     \
  -v PATH:/mnt/data                             \
  -e "MINIO_VOLUMES=/mnt/data"                  \
  --name "minio_local"                          \
  minio server --console-address ":9090"
astro dev start -n --wait 5m