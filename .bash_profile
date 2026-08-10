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
		XDG_SEAT XDG_SESSION_ID XDG_SESSION_CLASS \
		XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
		XDG_CONFIG_DIRS XDG_DATA_DIRS \
		XDG_BIN_DIR XDG_LIB_DIR \
		XDG_DOCUMENTS_DIR XDG_DOWNLOAD_DIR XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_TEMPLATES_DIR XDG_VIDEOS_DIR
	# import environment to dbus
	# man:dbus-update-activation-environment(1)
	dbus-update-activation-environment --systemd \
		PATH \
		XDG_SEAT XDG_SESSION_ID XDG_SESSION_CLASS \
		XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
		XDG_CONFIG_DIRS XDG_DATA_DIRS \
		XDG_BIN_DIR XDG_LIB_DIR \
		XDG_DOCUMENTS_DIR XDG_DOWNLOAD_DIR XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_TEMPLATES_DIR XDG_VIDEOS_DIR

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

	# show a menu and wait for single-key input
	function login-menu {
		local menu
		trap '' INT # ignore ^C
		IFS='' read -r -d '' menu << ENDMENU || : EOF
${setaf[13]}┌───────────┬─────────┬──────────┐${terminfo[sgr0]}
${setaf[13]}│${terminfo[sgr0]} ${setaf[12]}Graphical${terminfo[sgr0]} ${setaf[13]}│${terminfo[sgr0]} ${setaf[12]}Console${terminfo[sgr0]} ${setaf[13]}│${terminfo[sgr0]} ${setaf[12]}Session${terminfo[sgr0]}  ${setaf[13]}│${terminfo[sgr0]}
${setaf[13]}│${terminfo[sgr0]}  ${setaf[8]}<enter>${terminfo[sgr0]}  ${setaf[13]}│${terminfo[sgr0]}  ${setaf[8]}<^D>${terminfo[sgr0]}   ${setaf[13]}│${terminfo[sgr0]}  ${setaf[8]}<^L>${terminfo[sgr0]}    ${setaf[13]}│${terminfo[sgr0]}
${setaf[13]}├───────────┼─────────┼──────────┤${terminfo[sgr0]}
${setaf[13]}│${terminfo[sgr0]} ${setaf[9]}s${terminfo[sgr0]}way      ${setaf[13]}│${terminfo[sgr0]} ${setaf[9]}t${terminfo[sgr0]}mux    ${setaf[13]}│${terminfo[sgr0]} loc${setaf[9]}k${terminfo[sgr0]}     ${setaf[13]}│${terminfo[sgr0]}
${setaf[13]}│${terminfo[sgr0]} ${setaf[11]}n${terminfo[sgr0]}iri      ${setaf[13]}│${terminfo[sgr0]} ${setaf[11]}z${terminfo[sgr0]}sh     ${setaf[13]}│${terminfo[sgr0]} ${setaf[11]}l${terminfo[sgr0]}ogout   ${setaf[13]}│${terminfo[sgr0]}
${setaf[13]}│${terminfo[sgr0]} ${setaf[11]}c${terminfo[sgr0]}age      ${setaf[13]}│${terminfo[sgr0]} ${setaf[11]}b${terminfo[sgr0]}ash    ${setaf[13]}│${terminfo[sgr0]} ${setaf[11]}r${terminfo[sgr0]}eboot   ${setaf[13]}│${terminfo[sgr0]}
${setaf[13]}│${terminfo[sgr0]} ${setaf[11]}o${terminfo[sgr0]}penbox   ${setaf[13]}│${terminfo[sgr0]}         ${setaf[13]}│${terminfo[sgr0]} ${setaf[11]}p${terminfo[sgr0]}oweroff ${setaf[13]}│${terminfo[sgr0]}
${setaf[13]}└───────────┴─────────┴──────────┘${terminfo[sgr0]}${terminfo[civis]}
ENDMENU
		printf '%b' "$menu"
		# control loop
		while : ; do
			read -s -N1 || : EOF
			case "$REPLY" in
				$'\x0a' | 's' )
					if systemctl -q --user is-active graphical-session.target ; then
						echo -n "bash: graphical-session is already running" ; sleep 1
						echo -n "${terminfo[cr]}${terminfo[el]}"
						continue
					fi
					trap - INT
					exec wm sway
				;;
				'n' )
					if systemctl -q --user is-active graphical-session.target ; then
						echo -n "bash: graphical-session is already running" ; sleep 1
						echo -n "${terminfo[cr]}${terminfo[el]}"
						continue
					fi
					trap - INT
					exec wm niri
				;;
				'c' )
					if systemctl -q --user is-active graphical-session.target ; then
						echo -n "bash: graphical-session is already running" ; sleep 1
						echo -n "${terminfo[cr]}${terminfo[el]}"
						continue
					fi
					trap - INT
					exec wm cage
				;;
				'o' )
					if systemctl -q --user is-active graphical-session.target ; then
						echo -n "bash: graphical-session is already running" ; sleep 1
						echo -n "${terminfo[cr]}${terminfo[el]}"
						continue
					fi
					trap - INT
					exec xi openbox
				;;
				$'\x04' | 't' )
					trap - INT
					if ! systemctl -q --user is-active tmux-daemon.service ; then
						systemctl -q --user start tmux-daemon.service ; sleep 1
					fi
					set-console-theme gruvbox-dark ; echoti clear
					exec tmux -S "$XDG_RUNTIME_DIR/tmux" \
						new-session -A -s login -- bash
				;;
				'z' )
					trap - INT
					set-console-theme gruvbox-dark ; echoti clear
					exec zsh
				;;
				'b' )
					trap - INT
					set-console-theme gruvbox-dark ; echoti clear
					return # exit menu
				;;
				$'\x0c' | 'k' )
					echo -n "$TTY is locked by $USER, input password: ${terminfo[cnorm]}"
					vlock &> /dev/null
					echo -n "${terminfo[cr]}${terminfo[el]}${terminfo[civis]}"
				;;
				'l' ) logout ;;
				'r' )
					if systemctl -q --user is-active graphical-session.target ; then
						echo -n "bash: graphical-session is running, refusing operation" ; sleep 1
						echo -n "${terminfo[cr]}${terminfo[el]}"
						continue
					fi
					reboot
				;;
				'p' )
					if systemctl -q --user is-active graphical-session.target ; then
						echo -n "bash: graphical-session is running, refusing operation" ; sleep 1
						echo -n "${terminfo[cr]}${terminfo[el]}"
						continue
					fi
					poweroff
				;;
			esac
		done
	} ; login-menu
fi

. "$HOME/.bashrc" || return # broken


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
