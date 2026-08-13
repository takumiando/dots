#!/bin/sh

if makoctl mode 2>/dev/null | grep -qx 'do-not-disturb'; then
    printf '%s\n' '{"text":"","tooltip":"Do not disturb (middle click to disable)","class":"dnd"}'
else
    printf '%s\n' '{"text":"","tooltip":"Notifications (middle click for DND)","class":"normal"}'
fi
