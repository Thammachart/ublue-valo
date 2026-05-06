#!/bin/bash

set -ouex pipefail

# dnf remove -y 'plymouth*'
# rm -rf /usr/lib/dracut/modules.d/50plymouth

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

dnf install -y \
    neovim helix chezmoi \
    greetd gtkgreet sway \
    adw-gtk3-theme \
    ghostty \
    firefox brave-browser

dnf install -y \
    niri dms

dnf install -y \
    google-noto-fonts-all \
    liberation-fonts-all \
    nerd-fonts \
    jetbrains-mono-fonts \
    cascadia-code-fonts \
    vercel-geist-fonts \
    rsms-inter-fonts

# dnf -y install \
#     hyprland hypridle hyprland-guiutils

dnf install -y nushell --setopt=tsflags=noscripts

dnf -y clean all
