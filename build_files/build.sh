#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y \
    greetd gtkgreet sway

# Use a COPR
dnf5 -y copr enable lionheartp/Hyprland

dnf5 -y install hyprland hypridle

# Disable COPRs so they don't end up enabled on the final image:
dnf5 -y copr disable lionheartp/Hyprland

dnf5 clean all

cp -v /ctx/greetd/* /etc/greetd/

rm -rf /run/dnf /run/selinux-policy

#### Example for enabling a System Unit File
systemctl enable greetd
systemctl enable podman.socket
