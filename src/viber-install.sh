#!/usr/bin/env bash

wget -O viber.deb http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb

sudo dpkg -i viber.deb

rm viber.deb
