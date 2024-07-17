#!/bin/bash

# Define the order of workspaces you want
order="1 2 3"

for ws in $order; do
    if i3-msg -t get_workspaces | grep -q "name\":\"$ws\""; then
        echo " $ws"
    fi
done

