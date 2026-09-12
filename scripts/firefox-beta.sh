#!/bin/sh

./distrobox.sh

dnf5 update -y
dnf5 config-manager addrepo --id=mozilla --set=baseurl=https://packages.mozilla.org/rpm/firefox --set=gpgkey=https://packages.mozilla.org/rpm/firefox/signing-key.gpg --set=gpgcheck=1 --set=repo_gpgcheck=0 --set=priority=10

./rpmfusion.sh

grep -v '^#' ./firefox-beta.txt | xargs -r dnf5 install -y
