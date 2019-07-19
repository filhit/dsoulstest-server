date
echo "Rotating logs"
logrotate -f -s /home/filhit/minetest-backups/logrotate.state /home/filhit/dsoulstest-server/logrotate.conf
echo "Stopping service"
sudo systemctl stop minetest-server
echo "Backing up to file"
tar -cv /home/filhit/.minetest | gzip > /home/filhit/minetest-backups/minetest.tar.gz
if [ "$1" == "--no-remote" ]; then
  echo "Skipping remote backup"
else
  echo "Backing up to aws s3"
  aws s3 cp /home/filhit/minetest-backups/minetest.tar.gz s3://dsoulstest-server-backups/minetest.tar.gz
  /home/filhit/dsoulstest-server/update-maps.sh
fi
echo "Starting service"
sudo systemctl start minetest-server
