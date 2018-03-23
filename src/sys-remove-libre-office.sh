#!/usr/bin/env bash

sudo apt-get remove --purge libreoffice* -y
sudo dpkg -P libreoffice -y
sudo apt-get clean
sudo apt-get autoremove
