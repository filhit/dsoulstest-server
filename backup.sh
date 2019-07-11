sudo systemctl stop minetest-server
tar -cv /home/filhit/.minetest | gzip | aws s3 cp - s3://dsoulstest-server-backups/minetest.tar.gz
sudo systemctl start minetest-server
