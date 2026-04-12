#!/bin/bash

set -ouex pipefail

# dnf clean all
rm -rf /run/dnf /run/selinux-policy
