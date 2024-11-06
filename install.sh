#!/usr/bin/env sh

set -e

dnf install -y \
    epel-release

dnf config-manager --save \
    --setopt=exclude=PackageKit,PackageKit-command-not-found,rootfiles,firefox,totem,gnome-tour

dnf install -y --nobest \
    @workstation-product-environment

dnf install -y --nobest --setopt=group_package_types=mandatory,default,optional \
    @container-management

dnf install -y \
    flatpak \
    podman-compose \
    zsh

mkdir -p /etc/flatpak/remotes.d && \
    curl -o /etc/flatpak/remotes.d/flathub.flatpakrepo  https://dl.flathub.org/repo/flathub.flatpakrepo

systemctl enable \
    gdm.service
