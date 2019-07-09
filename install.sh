#!/usr/bin/env bash

set -e
sudo add-apt-repository ppa:minetestdevs/stable
sudo apt-get update
sudo apt-get install minetest awscli
sudo cp minetest-server.service /etc/systemd/system/
sudo systemctl enable minetest-server
sudo systemctl start minetest-server
