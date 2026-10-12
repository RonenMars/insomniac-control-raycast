#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Insomniac Sleep
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ☕
# @raycast.argument1 { "type": "text", "placeholder": "allow / disallow / toggle", "optional": true }
# @raycast.packageName System Utility

# Documentation:
# @raycast.description Control sleep prevention by launching or quitting Insomniac.
# @raycast.author RonenMars

set -e

ACTION=$(echo "${1:-toggle}" | tr '[:upper:]' '[:lower:]')

if [[ "$ACTION" == "toggle" ]]; then
    if pgrep -x "Insomniac" > /dev/null; then
        ACTION="allow"
    else
        ACTION="disallow"
    fi
fi

if [[ "$ACTION" == "disallow" || "$ACTION" == "block" || "$ACTION" == "awake" ]]; then
    # Open the app to disallow Mac sleep (enforce your rules)
    if pgrep -x "Insomniac" > /dev/null; then
        echo "Insomniac is already running"
    else
        open -a "Insomniac"
        echo "Insomniac launched"
    fi

elif [[ "$ACTION" == "allow" || "$ACTION" == "permit" || "$ACTION" == "sleep" ]]; then
    # Quit the app to allow the Mac to sleep normally
    if pgrep -x "Insomniac" > /dev/null; then
        osascript -e 'quit application "Insomniac"'
        echo "Insomniac closed"
    else
        echo "Insomniac is not running"
    fi

else
    echo "Invalid command. Use 'allow', 'disallow', or 'toggle'." >&2
    exit 1
fi
