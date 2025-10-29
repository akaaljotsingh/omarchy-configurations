#!/bin/bash

KEYBOARD_DEVICE="at-translated-set-2-keyboard"

# Get the current 'enabled' state for the device.
# We look for the 'int: 1' or 'int: 0' line.
STATUS_LINE=$(hyprctl getoption device:"$KEYBOARD_DEVICE":enabled | grep 'int: ')

# Check if the STATUS_LINE contains 'int: 1' (meaning ENABLED)
if echo "$STATUS_LINE" | grep -q 'int: 1'; then
    # Keyboard is currently ENABLED, so DISABLE it
    hyprctl keyword "device:$KEYBOARD_DEVICE:enabled" false
    notify-send -t 3000 "⌨️ Laptop Keyboard Disabled"
else
    # Keyboard is currently DISABLED (or status not found), so ENABLE it
    hyprctl keyword "device:$KEYBOARD_DEVICE:enabled" true
    notify-send -t 3000 "✅ Laptop Keyboard Enabled"
fi
