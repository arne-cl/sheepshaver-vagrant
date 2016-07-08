#!/bin/bash

# Fetches and verifies rom and boot image

baseurl="http://www.redundantrobot.com/macemulator/"
filenames=("newworld86.rom.zip" "OS9.img")

declare -A checksums

checksums=( ["newworld86.rom.zip"]="ded05b02d0973476e8afcdcb199d9130c52b0f13932a881f8dc901ad5de16362" ["OS9.img"]="35e4b0f15c5f7b52f91fe6db10f43cb78cc02ad01390d2c24db7009d182f3f82" )

for filename in "${filenames[@]}"; do

	wget --no-verbose "$baseurl$filename" -O "$filename"

	if [ "$(sha256sum $filename)" != "${checksums[$filename]}  $filename" ]; then
		echo "$filename checksum mismatch"
		echo "$(sha256sum $filename)"
		echo "${checksums[$filename]}  $filename"
		exit
	fi
	echo "$filename OK"

	if [ "$filename" == "newworld86.rom.zip" ]; then
		unzip "$filename" -d /home/vagrant/
		rm "$filename"
	fi
done
