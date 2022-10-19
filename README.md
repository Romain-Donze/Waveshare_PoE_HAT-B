# Waveshare_PoE_HAT-B
Complete package to easily set up the WaveShare Raspberry Pi PoE HAT Type (B) with display

Derived from https://www.waveshare.com/wiki/PoE_HAT_(B)
Derived from https://gist.github.com/CharlesGodwin/adda3532c070f6f6c735927a5d6e8555

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
