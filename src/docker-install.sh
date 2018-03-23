#!/usr/bin/env bash

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update

apt-cache policy docker-engine

sudo apt-get install docker-engine -y

systemctl status docker.service

echo 'sudo usermod -aG docker $(whoami)'
echo 'restart linux'
