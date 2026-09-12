#!/bin/sh

./distrobox.sh

dnf5 update -y

# Proton Mail Beta
wget https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm
dnf5 install -y ./ProtonMail-desktop-beta.rpm
rm -f ./ProtonMail-desktop-beta.rpm

# Proton Pass
wget https://proton.me/download/pass/linux/ProtonPass.rpm
dnf5 install -y ./ProtonPass.rpm
rm -f ./ProtonPass.rpm

grep -v '^#' ./proton-apps.txt | xargs -r dnf5 install -y
