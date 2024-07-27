#!/bin/bash

# Define the sink name
SINK_NAME="alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink"

# Function to increase volume by a percentage or level
increase_volume() {
    pactl set-sink-volume "$SINK_NAME" +"$1"
    show_notification
}

# Function to decrease volume by a percentage or level
decrease_volume() {
    pactl set-sink-volume "$SINK_NAME" -"$1"
    show_notification
}

# Function to toggle mute/unmute
toggle_mute() {
    pactl set-sink-mute "$SINK_NAME" toggle
    show_notification
}

# Function to show notification with volume level
show_notification() {
    local volume=$(get_volume)
    dunstify -t 1500 -r 2593 -u normal "Volume" "Current Volume: ${volume}%"
}

# Function to get current volume percentage
get_volume() {
    pactl list sinks | grep -A 15 "$SINK_NAME" | grep 'Volume:' | head -n 1 | awk -F ' ' '{print $5}' | sed 's/[%|]//g'
}

# Main script
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <command> [<amount>]"
    echo "Commands:"
    echo "  increase <amount>"
    echo "  decrease <amount>"
    echo "  toggle"
    exit 1
fi

command="$1"

case "$command" in
    increase)
        if [ "$#" -eq 2 ]; then
            increase_volume "$2"
        else
            echo "Usage: $0 increase <amount>"
            exit 1
        fi
        ;;
    decrease)
        if [ "$#" -eq 2 ]; then
            decrease_volume "$2"
        else
            echo "Usage: $0 decrease <amount>"
            exit 1
        fi
        ;;
    toggle)
        toggle_mute
        ;;
    *)
        echo "Invalid command. See --help for usage."
        exit 1
        ;;
esac

exit 0

