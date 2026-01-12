#!/hint/bash
# vim:ft=bash:noet:ts=3:sw=3:
# man:bash(1)#INVOCATION
# file:$HOME/.bash_profile
#==============================================================================#


. "$HOME/.bashenv" || return # broken

if [[ -n "$SSH_CLIENT" ]] ; then # persistent session
	if [[ ! "$TERM" =~ tmux ]] ; then # avoid nesting
		if ! systemctl -q --user is-active tmux-daemon.service ; then
			systemctl -q --user start tmux-daemon.service ; sleep 1
		fi
		exec tmux -S "$XDG_RUNTIME_DIR/tmux" \
			new-session -A -s ssh -- bash
	fi
elif [[ -n "$XDG_VTNR" ]] ; then # login menu
	# import environment to systemd
	# man:systemctl(1)
	systemctl -q --user import-environment \
		PATH \
		XDG_SEAT XDG_SESSION_ID XDG_SESSION_CLASS XDG_VTNR \
		XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
		XDG_CONFIG_DIRS XDG_DATA_DIRS \
		XDG_BIN_DIR XDG_LIB_DIR
	# import environment to dbus
	# man:dbus-update-activation-environment(1)
	dbus-update-activation-environment --systemd \
		PATH \
		XDG_SEAT XDG_SESSION_ID XDG_SESSION_CLASS XDG_VTNR \
		XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
		XDG_CONFIG_DIRS XDG_DATA_DIRS \
		XDG_BIN_DIR XDG_LIB_DIR

	# $1: THEME
	function set-console-theme { local -r theme="$1"
		case "$theme" in
			gruvbox-dark )
				printf '\e]P%x%.6x' \
					 0 0x1d2021 \
					 1 0xcc241d \
					 2 0x98971a \
					 3 0xd79921 \
					 4 0x458588 \
					 5 0xb16286 \
					 6 0x689d6a \
					 7 0xebdbb2 \
					 8 0x928374 \
					 9 0xfb4934 \
					10 0xb8bb26 \
					11 0xfabd2f \
					12 0x83a598 \
					13 0xd3869b \
					14 0x8ec07c \
					15 0xebdbb2
			;;
			gruvbox-light )
				printf '\e]P%x%.6x' \
					 0 0xf2e5bc \
					 1 0xcc241d \
					 2 0x98971a \
					 3 0xd79921 \
					 4 0x458588 \
					 5 0xb16286 \
					 6 0x689d6a \
					 7 0x3c3836 \
					 8 0x928374 \
					 9 0x9d0006 \
					10 0x79740e \
					11 0xb57614 \
					12 0x076678 \
					13 0x8f3f71 \
					14 0x427b58 \
					15 0x3c3836
			;;
			'') return 2 ;;
			* ) return 3 ;;
		esac ; _CONSOLE_THEME="$theme"
	}
fi

. "$HOME/.bashrc" || return # broken


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
