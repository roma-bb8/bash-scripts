#!/usr/bin/env bash

cd /tmp

wget -O viber.deb http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb

sudo dpkg -i /tmp/viber.deb

rm /tmp/viber.deb

viber
