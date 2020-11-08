#!/bin/sh
# ${XDG_CONFIG_HOME}/X11/client.d/10-xrdb.sh
# vim:ft=sh:fenc=utf-8:noet:ts=3:sw=3:

: ${HOME:?}

xrdb -override "${XDG_CONFIG_HOME:-${HOME}/.config}/X11/resources"
