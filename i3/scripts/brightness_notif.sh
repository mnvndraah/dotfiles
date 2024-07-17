#!/bin/bash

# Function to get current brightness and send notification
get_brightness() {
    current_brightness=$(brightnessctl | grep -oP '\d+%' | head -1)
    notify-send -i "󰃠" "Brightness is now set to$current_brightness"
}

# Function to decrease brightness by 2%
decrease_brightness() {
    brightnessctl set 2%-
}

# Function to increase brightness by 2%
increase_brightness() {
    brightnessctl set +2%
}

# Check which key combination was pressed and call respective function
case "$1" in
    "down")
        decrease_brightness
        get_brightness
        ;;
    "up")
        increase_brightness
        get_brightness
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

