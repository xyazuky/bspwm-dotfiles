#!/bin/bash

control_media() {
	playerctl "$1" >/dev/null 2>&1
}

icon_previous() {
	echo "<span font='FontAwesome'></span>"
}

icon_next() {
	echo "<span font='FontAwesome'></span>"
}

update_pause_icon() {
	player_status=$(playerctl status)
	if [ "$player_status" = "Playing" ]; then
		echo ""
	elif [ "$player_status" = "Paused" ]; then
		echo ""
	else
		echo
	fi
}

status_check() {
	if pgrep -x "spotify" >/dev/null; then
		exit 0
	else
		exit 1
	fi
}

update_songtitle_icon() {
	player_status=$(playerctl status)

	# Only update if player status has changed or song title has changed
	if [ "$player_status" = "Playing" ] || [ "$player_status" = "Paused" ]; then
		artist=$(playerctl metadata artist)
		title=$(playerctl metadata title)
		player=$(playerctl metadata --format "{{playerName}}")
		if [ "$player" = "spotify" ]; then
			player_icon="%{F#1DB954} %{F-}"
			current_song="$player_icon $artist - $title"

		elif [ "$player" = "firefox" ]; then
			player_icon="%{F#FF0000}󰗃 %{F-}"
			current_song="$player_icon $title"

		else
			palyer_icon=" "
			current_song="$player_icon $artist - $title"

		fi

		if [ "$player_status" != "$last_player_status" ] || [ "$current_song" != "$last_song_title" ]; then
			last_player_status="$player_status"
			last_song_title="$current_song"
			echo "$last_song_title"
		fi
	else
		last_player_status=""
		last_song_title=""
		echo
	fi
}

toggle_spotify_workspace() {
	PREV_WS_FILE="/tmp/prev_workspace"

	CURRENT_WS=$(bspc query -D -d focused --names)

	SPOTIFY_WS=$(xdo id -N Spotify | xargs -I{} -n1 bspc query -D -n {} --names)
	if [ "$CURRENT_WS" == "$SPOTIFY_WS" ]; then
		if [ -f "$PREV_WS_FILE" ]; then
			PREV_WS=$(cat "$PREV_WS_FILE")
			bspc desktop "$PREV_WS" -f
			rm "$PREV_WS_FILE"
		else
			echo "No previous workspace recorded."
		fi
	else
		echo "$CURRENT_WS" >"$PREV_WS_FILE"
		bspc desktop "$SPOTIFY_WS" -f
	fi
}

case "$1" in
"previous")
	control_media "previous"
	;;
"playpause")
	control_media "play-pause"
	;;
"next")
	control_media "next"
	;;
"pause-icon")
	update_pause_icon
	;;
"songtitle_icon")
	update_songtitle_icon
	;;
"status-check")
	status_check
	;;
"icon-previous")
	icon_previous
	;;
"icon-next")
	icon_next
	;;
"toggle-workspace")
	toggle_spotify_workspace
	;;
*)
	echo "Unknown action: $1"
	exit 1
	;;
esac
