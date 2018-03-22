#!/usr/bin/env bash

cd /tmp

wget https://repo.skype.com/latest/skypeforlinux-64.deb

sudo dpkg -i /tmp/skypeforlinux-64.deb

rm /tmp/skypeforlinux-64.deb

skypeforlinux
