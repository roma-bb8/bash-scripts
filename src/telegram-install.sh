#!/usr/bin/env bash

sudo add-apt-repository ppa:atareao/telegram

sudo apt-get update

sudo apt-get install telegram

ln -s /opt/telegram/telegram /usr/local/bin/telegram

telegram
