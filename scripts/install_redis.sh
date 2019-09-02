#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

set -ex

apt update
apt install redis-server -y
systemctl start redis-server
# give redis-server a few seconds to wake up
sleep 3
if [[ "$( echo 'ping' | /usr/bin/redis-cli )" == "PONG" ]] ; then
    echo "ping worked"
else
    echo "ping FAILED"
    exit 1
fi

exit 0

set +x