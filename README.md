## SheepShaver Vagrant

A Vagrant configuration for running SheepShaver over X11 forwarding.

The directory 'shared' will be available within SheepShaver.

## Requirements
- PulseAudio
- Vagrant
- Virtual Box

During provisioning, a Mac OS ROM and bootable OS9 image will be downloaded from http://www.redundantrobot.com/. If this site is inaccessible, provisioning will fail.

## Usage
Clone or download this repository; then
```
cd sheepshaver-vagrant
mkdir shared
vagrant up
vagrant ssh
SheepShaver_44_SDL
```
