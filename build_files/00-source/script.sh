#!/bin/bash

set -ouex pipefail

sed -i 's|^\(metalink=.*\)|\1\&country=au,us,jp\&protocol=https|' \
        /etc/yum.repos.d/*.repo

cp -v /ctx/repos/* /etc/yum.repos.d/

# Brave official repo
dnf -y config-manager addrepo \
    --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

# Workaround of /opt being not persistent (e.g brave)
rm /opt
mkdir /opt

# dnf -y copr enable lionheartp/Hyprland
dnf -y copr enable yalter/niri
dnf -y copr enable avengemedia/dms
dnf -y copr enable che/nerd-fonts
