#!/bin/bash
# 2022-10-18 Romain Donzé
#  Derived from https://www.waveshare.com/wiki/PoE_HAT_(B)
#  Derived from https://gist.github.com/CharlesGodwin/adda3532c070f6f6c735927a5d6e8555
# enable i2c interface if necessary
#
IS_I2C=`sudo raspi-config nonint get_i2c`
[ $IS_I2C -ne 0 ]&&sudo raspi-config nonint do_i2c 0
# install required packages
sudo apt update
sudo apt install -y python3-pip python3-pil libatlas-base-dev
sudo pip3 install RPi.GPIO smbus numpy
# copy required parts to ~/.poe-hat directory
[ -d ~/.poe-hat ] && rm -rf ~/.poe-hat
mkdir -p ~/.poe-hat
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cp -r $SCRIPT_DIR/PoE_HAT_B_code/* ~/.poe-hat
# cleanup
rm -rf $SCRIPT_DIR
#
# define and enable service
#
PYTHON=`which python3 |head -n1`
cat <<EOF >poe-hat.service
[Unit]
Description=Waveshare Poe Hat B
After=network.target

[Service]
Environment=systemd=true
ExecStart=${PYTHON} ${HOME}/.poe-hat/main.py
Restart=always
RestartSec=30

[Install]
WantedBy=multi-user.target
EOF
sudo mv -f poe-hat.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable poe-hat.service
sudo systemctl restart poe-hat.service
sudo systemctl status poe-hat.service --no-pager
