#!/bin/bash

apt-get update
apt-get dist-upgrade

# sheepshaver dependencies and unzip (just tarball it instead)
apt-get install -y libsdl1.2debian dbus-x11 libxxf86dga1 libxxf86vm1 libesd0

apt-get install -y paprefs pavucontrol pulseaudio-esound-compat
apt-get install -y osspd libasound2 libasound2-plugins alsa-utils alsa-oss
apt-get install -y pulseaudio-utils

dbus-launch

# prepare pulseaudio
echo "load-module module-native-protocol-tcp auth-anonymous=1" >> /etc/pulse/system.pa
echo "load-module module-zeroconf-publish" >> /etc/pulse/system.pa

# prevent snd_pcm_recover underrun
echo 'default-fragments = 8' >> /etc/pulse/daemon.conf
echo 'default-fragment-size-msec = 10' >> /etc/pulse/daemon.conf

# allows sheepshaver without root
sysctl vm.mmap_min_addr=0
echo 'vm.mmap_min_addr=0' >> /etc/sysctl.conf
systemctl start procps

# not sure if used. maybe we won't have to do it by paprefs if we do this here?
echo 'load-module module-esound-protocol-tcp' >> /etc/pulse/default.pa
echo 'load-module module-native-protocol-tcp' >> /etc/pulse/default.pa
echo 'load-module module-zeroconf-publish' >> /etc/pulse/default.pa

# prepare sheepshaver
apt-get install -y unzip
unzip /vagrant/data/SheepShaver_GCC44_SDL_Unix_29-07-2013.zip -d /usr/local/bin/
