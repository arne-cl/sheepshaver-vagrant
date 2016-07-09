aconnect -x
pulseaudio --start 2> /dev/null
pax11publish -r
pacmd set-sink-mute 0 0
amixer -q sset 'Master' 100%
