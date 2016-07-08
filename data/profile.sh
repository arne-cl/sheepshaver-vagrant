pulseaudio --start
pax11publish -r
pacmd set-sink-mute 0 0
amixer -q sset 'Master' 100%
