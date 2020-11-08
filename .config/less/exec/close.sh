#!/bin/sh
# ${XDG_CONFIG_HOME}/less/exec/close.sh
# vim:ft=sh:fenc=utf-8:noet:ts=3:sw=3:

: ${2:?}

exec rm -- "${2}"
