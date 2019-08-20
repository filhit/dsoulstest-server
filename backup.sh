echo "Starting minetest-server backup"
echo "Rotating local backups"
/usr/sbin/logrotate -f -s /home/filhit/minetest-backups/logrotate.state /home/filhit/dsoulstest-server/logrotate.conf
echo "Stopping minetest-server service"
sudo systemctl stop minetest-server
echo "Backing up to file"
tar -C /home/filhit/ -c .minetest | gzip > /home/filhit/minetest-backups/minetest.tar.gz
if [ "$1" == "--no-remote" ]; then
  echo "Skipping remote backup"
else
  echo "Backing up to aws s3"
  aws s3 cp /home/filhit/minetest-backups/minetest.tar.gz s3://dsoulstest-server-backups/minetest.tar.gz --no-progress
  /home/filhit/dsoulstest-server/update-maps.sh
fi
echo "Starting minetest-server service"
sudo systemctl start minetest-server
echo "Backing up minetest-server finished"
