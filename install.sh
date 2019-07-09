#!/usr/bin/env bash

set -e
sudo cp minetest-server.service /etc/systemd/system/
sudo systemctl enable minetest-server
sudo systemctl start minetest-server
