echo "Updating minetest maps"
/home/filhit/minetestmapper/minetestmapper -i /home/filhit/.minetest/worlds/our-world -o /home/filhit/minetest-maps/map.png --zoom 2
convert /home/filhit/minetest-maps/map.png -resize 50% /home/filhit/minetest-maps/map-half.png
convert /home/filhit/minetest-maps/map.png -resize 64x64 /home/filhit/minetest-maps/map-64.png
convert /home/filhit/minetest-maps/map.png -resize 128x128 /home/filhit/minetest-maps/map-128.png
convert /home/filhit/minetest-maps/map.png -resize 256x256 /home/filhit/minetest-maps/map-256.png
convert /home/filhit/minetest-maps/map.png -resize 512x512 /home/filhit/minetest-maps/map-512.png
convert /home/filhit/minetest-maps/map.png -resize 1024x1024 /home/filhit/minetest-maps/map-1024.png
convert /home/filhit/minetest-maps/map.png -resize 2048x2048 /home/filhit/minetest-maps/map-2048.png
echo "Updated maps. Uploading them to azure."
sas=`cat /home/filhit/sas.txt`
/usr/local/bin/azcopy sync /home/filhit/minetest-maps/ https://mineteststorageaccount.blob.core.windows.net/\$web/$sas --recursive=true
