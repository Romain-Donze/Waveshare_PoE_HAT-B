# Waveshare_PoE_HAT-B
Complete package to easily set up the WaveShare Raspberry Pi PoE HAT Type (B) with display

The supplied program will control the fan but for it to work you must slide the FAN switch on the HAT to the P0 position.

To install this service, you can clone this repository and then run the setup script

```bash
cd
git clone https://github.com/Romain-Donze/Waveshare_PoE_HAT-B.git
bash Waveshare_PoE_HAT-B/setup.sh
```

To remove and disable the service, run these commands

```bash
sudo systemctl disable poe-hat.service
sudo systemctl stop poe-hat.service
rm -rf ~/.poe-hat
```
