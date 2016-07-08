#!/bin/bash

# Fetches (or copies) and verifies rom and boot image

filenames=("newworld86.rom.zip" "OS9.img")
datadir=/vagrant/data
baseurl="http://www.redundantrobot.com/macemulator/"

for filename in "${filenames[@]}"; do
	if [ -e $datadir/$filename ]; then
		cp $datadir/$filename /home/vagrant/
	else
		wget --no-verbose "$baseurl$filename" -O "$filename"
	fi
done

sha256sum -c /vagrant/data/SHA256SUMS.txt

if [ $? != 0 ]; then
	exit
else
	unzip "newworld86.rom.zip" -d /home/vagrant/
	rm "newworld86.rom.zip"
fi
