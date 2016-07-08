#!/bin/bash

cp /vagrant/data/sheepshaver_prefs /home/vagrant/.sheepshaver_prefs
cat /vagrant/data/profile.sh >> /home/vagrant/.profile
echo 'pulseaudio --kill' >> /home/vagrant/.logout
