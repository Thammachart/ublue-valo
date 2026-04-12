#!/bin/bash

set -ouex pipefail

sed -i 's|^\(metalink=.*\)|\1\&country=JP\&country=SG|' \
        /etc/yum.repos.d/*.repo

dnf -y copr enable lionheartp/Hyprland
