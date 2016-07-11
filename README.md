## SheepShaver Vagrant

A Vagrant configuration for SheepShaver over X11 forwarding.

## Requirements
- Vagrant
- Virtual Box

During provisioning, 'newworld86.rom.zip' and 'OS9.img' will be downloaded from http://www.redundantrobot.com/. If you already have these files (or want to use your own), place them in the 'data' directory. If your filenames differ, update data/SHA256SUMS.txt and scripts/download.sh.

## Usage
Clone or download this repository; then
```
cd sheepshaver-vagrant
vagrant up
vagrant ssh
SheepShaver_44_SDL
```

Select the "Built-in" output device in OS9's sound control panel.

The directory 'shared' will be available to SheepShaver.
