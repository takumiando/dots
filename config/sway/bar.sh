#!/bin/sh

im () {
    case "$(fcitx5-remote)"    in
        1)
            printf "    en"
            ;;
        2)
            printf "    jp"
            ;;
    esac
}

volume () {
    VOL="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -n 1 2> /dev/null)"
    MUTE="$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')"

    if [ -z "$VOL" ]; then
        return 1
    fi

    printf "    vol: "

    if [ "$MUTE" = yes ]; then
        printf 'mute'
    else
        printf "%s" "$VOL"
    fi
}

battery () {
    BAT=/sys/class/power_supply/BAT0

    if [ ! -e "$BAT" ]; then
        return 1
    fi

    CAPACITY="$(cat "$BAT"/capacity)"
    STATUS="$(cat "$BAT"/status)"

    if [ "$STATUS" != "Discharging" ]; then
        CHARGING='+'
    fi

    printf "    bat: %s%%%s" "$CAPACITY" "$CHARGING"
}

clock () {
    DATETIME="$(date '+%Y-%m-%d %H:%M:%S')"
    printf "    %s" "$DATETIME"
}

while :
do
    printf "%s%s%s%s" "$(im)" "$(volume)" "$(battery)" "$(clock)"
    sleep 0.1
done
