#!/usr/bin/env bash

set -e
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo add-apt-repository ppa:minetestdevs/stable
sudo apt-get update
sudo apt-get install minetest awscli imagemagick git certbot
sudo certbot certonly --standalone
sudo setfacl -R -m u:filhit:rX /etc/letsencrypt/
curl -L https://aka.ms/downloadazcopy-v10-linux -o azcopyv10.tar \
  && tar -xf azcopyv10.tar --strip-components=1 \
  && sudo mv azcopy /usr/local/bin/azcopy \
  && rm azcopyv10.tar \
  && azcopy --version

# minetestmapper build dependencies
sudo apt-get install libgd-dev libsqlite3-dev libleveldb-dev libhiredis-dev libpq-dev cmake make
git clone git@github.com:minetest/minetestmapper.git /home/filhit/minetestmapper
cmake /home/filhit/minetestmapper
make -j2 -C /home/filhit/minetestmapper
wget https://daconcepts.com/vanessa/hobbies/minetest/colors.txt -O /home/filhit/.minetest/colors.txt
aws configure
sudo cp minetest-server.service /etc/systemd/system/
sudo cp minetest-web-server.service /etc/systemd/system/
sudo systemctl enable minetest-server
sudo systemctl start minetest-server
sudo cp backup-minetest-server-cron /etc/cron.d/
sudo cp download-sounds-cron /etc/cron.d/
mkdir /home/filhit/minetest-backups
mkdir /home/filhit/minetest-maps
