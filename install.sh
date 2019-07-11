#!/usr/bin/env bash

set -e
sudo add-apt-repository ppa:minetestdevs/stable
sudo apt-get update
sudo apt-get install minetest awscli imagemagick git
# minetestmapper build dependencies
sudo apt-get install libgd-dev libsqlite3-dev libleveldb-dev libhiredis-dev libpq-dev cmake make
git clone git@github.com:minetest/minetestmapper.git /home/filhit/minetestmapper
cmake /home/filhit/minetestmapper
make -j2 -C /home/filhit/minetestmapper
wget https://daconcepts.com/vanessa/hobbies/minetest/colors.txt -O /home/filhit/.minetest/colors.txt
aws configure
sudo cp minetest-server.service /etc/systemd/system/
sudo systemctl enable minetest-server
sudo systemctl start minetest-server
sudo cp backup-minetest-server-cron /etc/cron.d/
mkdir /home/filhit/minetest-backups
mkdir /home/filhit/minetest-maps
