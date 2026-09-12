#!/bin/sh

dnf5 install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 update -y
dnf5 config-manager setopt fedora-cisco-openh264.enabled=1
dnf5 install -y rpmfusion-\*-appstream-data
dnf5 swap -y ffmpeg-free ffmpeg --allowerasing
dnf5 install -y mesa-va-drivers-freeworld
dnf5 swap -y mesa-vulkan-drivers{,-freeworld}
dnf5 install -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
