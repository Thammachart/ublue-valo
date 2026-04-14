#!/bin/bash

set -ouex pipefail

echo "fuse" > /usr/lib/modules-load.d/fuse.conf

cp -v /ctx/kargs.d/* /usr/lib/bootc/kargs.d/
cp -v /ctx/greetd/config/* /etc/greetd/
cp -v /ctx/greetd/sessions/* /usr/bin/

systemctl enable greetd
systemctl enable podman.socket
