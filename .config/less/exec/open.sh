#!/bin/sh
# ${XDG_CONFIG_HOME}/less/exec/open.sh
# vim:ft=sh:fenc=utf-8:noet:ts=3:sw=3:

: ${1:?}

cmd=:
temp_file="$(mktemp)"
trap 'rm -- "${temp_file}"' EXIT

case "${1}" in
	*.Z) cmd=uncompress ;;
	*.bz2) cmd=bunzip2 ;;
	*.gz) cmd=gunzip ;;
	*.xz) cmd=unxz ;;
	*.zst) cmd=unzstd ;;
esac

${cmd} -c "${1}" 1>"${temp_file}" 2>/dev/null
[ -s "${temp_file}" ] && echo "${temp_file}"
