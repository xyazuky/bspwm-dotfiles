#!/bin/sh
# Script to manage Alacritty windows in BSPWM

# Arguments passed by BSPWM
wid=$1
class=$2
instance=$3
manage=$4
rectangle=$5

# Check if the window is Alacritty
if [ "$class" = "Alacritty" ]; then
	# Get the current mouse position
	eval "$(xdotool getmouselocation --shell)"

	# Calculate the position for Alacritty to spawn (adjust these values as needed)
	pos_x=$((X - 405)) # Adjust as needed
	pos_y=$((Y - 290)) # Adjust as needed

	# Move the Alacritty window to the calculated position
	xdotool windowmove "$wid" "$pos_x" "$pos_y"
fi
