#!/bin/bash

# find our working folder
D="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# current Unraid Version
UNRAID_VERSION="$(cat /etc/unraid-version | tr "." - | cut -d '"' -f2)"

docker start s3cmd
docker exec s3cmd s3cmd sync $D/$UNRAID_VERSION s3://lsio/unraid-nvidia/ --acl-public
docker stop s3cmd
