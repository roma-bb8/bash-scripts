#!/usr/bin/env bash

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo apt-get update
sudo apt-get install google-chrome-stable -y

# cd /tmp

# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
# sudo apt-get -f install -y

# rm /tmp/google-chrome-stable_current_amd64.deb
