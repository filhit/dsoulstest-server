date
echo "Stopping service"
sudo systemctl stop minetest-server
echo "Backing up to aws s3"
tar -cv /home/filhit/.minetest | gzip | aws s3 cp - s3://dsoulstest-server-backups/minetest.tar.gz
echo "Starting service"
sudo systemctl start minetest-server
