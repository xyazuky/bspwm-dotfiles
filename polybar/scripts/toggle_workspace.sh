#!/bin/bash

toggle_workspace() {

	APP_NAME=$1

	if [ "$APP_NAME" = "vesktop" ]; then
		APP_NAME="vesktop"
	elif [ "$APP_NAME" = "Spotify" ]; then
		APP_NAME="Spotify"
	elif [ "$APP_NAME" = "VSCode" ]; then
		APP_NAME="code-oss"
	elif [ "$APP_NAME" = "firefox" ]; then
		APP_NAME="firefox"
	else
		APP_NAME=$(playerctl metadata --format "{{playerName}}")
		if [ "$APP_NAME" = "spotify" ]; then
			APP_NAME="Spotify"
		fi
	fi

	echo "$APP_NAME"
	PREV_WS_FILE="/tmp/prev_workspace"
	CURRENT_WS=$(bspc query -D -d focused --names)

	# Get the workspace of the app
	APP_WS=$(xdo id -N "$APP_NAME" | xargs -I{} -n1 bspc query -D -n {} --names | head -n 1)

	if [ "$CURRENT_WS" == "$APP_WS" ]; then
		if [ -f "$PREV_WS_FILE" ]; then
			PREV_WS=$(cat "$PREV_WS_FILE")
			bspc desktop "$PREV_WS" -f
			rm "$PREV_WS_FILE"
		else
			echo "No previous workspace recorded."
		fi
	else
		echo "$CURRENT_WS" >"$PREV_WS_FILE"
		bspc desktop "$APP_WS" -f
	fi
}

# Ensure that an argument is provided
if [ -z "$1" ]; then
	echo "Usage: $0 <AppName>"
	exit 1
fi

# Call the function with the provided application name
toggle_workspace "$1"
