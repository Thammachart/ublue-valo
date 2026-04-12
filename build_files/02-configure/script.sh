#!/bin/bash

set -ouex pipefail

cp -v /ctx/greetd/config/* /etc/greetd/
cp -v /ctx/greetd/sessions/* /usr/bin/

systemctl enable greetd
systemctl enable podman.socket
