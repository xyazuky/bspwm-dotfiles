#!/bin/bash

# Cached variables
last_workspace=""
last_arch_color=""
last_desktops_border=""

arch-color() {
	CURRENT_WS=$(bspc query -D -d focused --names)

	if [ "$CURRENT_WS" != "$last_workspace" ]; then
		last_workspace="$CURRENT_WS"

		if [ "$CURRENT_WS" == '1' ]; then
			last_arch_color="%{B#000000}%{T1} 󰣇 %{T-}"
		else
			last_arch_color="%{B#09090F}%{T1} 󰣇 %{T-}"
		fi
	fi

	echo "$last_arch_color"
}

desktops-border() {
	CURRENT_WS=$(bspc query -D -d focused --names)

	if [ "$CURRENT_WS" != "$last_workspace" ]; then
		last_workspace="$CURRENT_WS"

		if [ "$CURRENT_WS" == '9' ]; then
			last_desktops_border="%{F#000000}%{T3}%{T-}"
		else
			last_desktops_border="%{F#09090F}%{T3}%{T-}"
		fi
	fi

	echo "$last_desktops_border"
}

case "$1" in
"arch")
	arch-color
	;;
"desktops")
	desktops-border
	;;
*)
	echo "Unknown action: $1"
	exit 1
	;;
esac
