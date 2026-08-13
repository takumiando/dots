#!/bin/sh

name=$(fcitx5-remote -n 2>/dev/null)

case "$name" in
    mozc)
        printf '%s\n' 'あ'
        ;;
    keyboard-*)
        printf '%s\n' 'A'
        ;;
    '')
        printf '%s\n' '?'
        ;;
    *)
        printf '%s\n' "$name"
        ;;
esac
