#!/bin/sh
# ${XDG_CONFIG_HOME}/X11/client.d/xss-lock.sh
# vim:ft=sh:fenc=utf-8:noet:ts=3:sw=3:

xss-lock --transfer-sleep-lock -- xlock &
