#!/bin/bash

# Fetches (or copies) and verifies rom and boot image

filepaths=("roms/newworld86.rom.zip" "disk_images/OS9.img")
datadir=/vagrant/data
baseurl="http://www.redundantrobot.com/sheepshaver_files/"

for filepath in "${filepaths[@]}"; do
	if [ -e $datadir/$filepath ]; then
		cp $datadir/$filepath /home/vagrant/
	else
		wget --no-verbose "$baseurl$filepath" -O "$filepath"
	fi
done

sha256sum -c /vagrant/data/SHA256SUMS.txt

if [ $? != 0 ]; then
	exit
else
	unzip "newworld86.rom.zip" -d /home/vagrant/
	rm "newworld86.rom.zip"
fi
