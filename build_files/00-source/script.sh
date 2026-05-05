#!/bin/bash

set -ouex pipefail

sed -i 's|^\(metalink=.*\)|\1\&country=au,us,jp\&protocol=https|' \
        /etc/yum.repos.d/*.repo

cp -v /ctx/repos/* /etc/yum.repos.d/

# dnf -y copr enable lionheartp/Hyprland
dnf -y copr enable yalter/niri
dnf -y copr enable avengemedia/dms
