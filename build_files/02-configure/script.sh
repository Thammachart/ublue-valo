#!/bin/bash

set -ouex pipefail

echo "fuse" > /usr/lib/modules-load.d/fuse.conf

cp -v /ctx/dracut/* /usr/lib/dracut/dracut.conf.d/
cp -v /ctx/kargs.d/* /usr/lib/bootc/kargs.d/
cp -v /ctx/greetd/config/* /etc/greetd/
cp -v /ctx/greetd/sessions/* /usr/bin/

systemctl enable greetd
systemctl enable podman.socket

systemctl mask NetworkManager-wait-online.service
systemctl mask systemd-remount-fs.service
systemctl mask fedora-atomic-desktop-appstream-cache-refresh.service

systemctl mask \
    nfs-client.target \
    gssproxy.service \
    rpc-statd.service \
    rpc-statd-notify.service
