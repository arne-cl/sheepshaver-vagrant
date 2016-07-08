## SheepShaver Vagrant

A headless server designed for X11 forwarding, including sound over pulseaudio.

The directory 'shared' will be available within SheepShaver.

## Requirements
- Virtual Box
- Vagrant
- Git

During provisioning, a Mac OS ROM and bootable OS9 image will be downloaded from http://www.redundantrobot.com/. If this site is inaccessible, provisioning will fail.


## Usage
```
vagrant up
vagrant ssh
SheepShaver_44_SDL
```
