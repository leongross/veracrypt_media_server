#!/bin/sh

# global vars
base_dir=/home/$USER/veracrypt_media_server
service=vera_media_server

git clone https://github.com/leongross/veracrypt_media_server.git /home/$USER

# copy servie and change permission
sudo cp $base_dir/$service.service /etc/systemd/system/
sudo chmod 644 /etc/systemd/system/$service.service

# enable service
sudo systemctl start $service
[ sudo systemctl status $service 2>/dev/null ] && sudo systemctl enable $service || echo "[-] Service could not start"
