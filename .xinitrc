#! /bin/sh

## Camera ##
sudo modprobe -r uvcvideo

## Languages ##
setxkbmap -layout us,ru,ua
setxkbmap -option
setxkbmap -option "grp:alt_shift_toggle"

## i3 ##
exec i3
