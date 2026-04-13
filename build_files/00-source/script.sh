#!/bin/bash

set -ouex pipefail

sed -i 's|^\(metalink=.*\)|\1\&country=JP\&country=SG\&protocol=https|' \
        /etc/yum.repos.d/*.repo

cp -v /ctx/repos/* /etc/yum.repos.d/

dnf -y copr enable lionheartp/Hyprland
