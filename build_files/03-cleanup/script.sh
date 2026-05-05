#!/bin/bash

set -ouex pipefail

rpm -ql greetd | grep -E 'sysusers|tmpfiles'

rm -rf /run/dnf /run/selinux-policy /var/lib/dnf
