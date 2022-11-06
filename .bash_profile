#!/hint/bash
# vim:ft=bash:noet:ts=3:sw=3:
# man:bash(1)
# file:$HOME/.bash_profile
#==============================================================================#


# prepare the environment
if [[ -r "$HOME/.bashenv" ]]; then
	source "$HOME/.bashenv"
fi


#==============================================================================#


# import to systemd
systemctl --user import-environment \
	PATH \
	SSH_AUTH_SOCK \
	XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
	XDG_CONFIG_DIRS XDG_DATA_DIRS \
	XDG_BIN_DIR XDG_LIB_DIR \
	XDG_DOCUMENTS_DIR XDG_DOWNLOAD_DIR XDG_GAMES_DIR XDG_MEDIA_DIR XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_PROJECTS_DIR XDG_TEMPLATES_DIR XDG_VIDEOS_DIR &>/dev/null

# import to dbus
dbus-update-activation-environment --systemd \
	PATH \
	SSH_AUTH_SOCK \
	XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
	XDG_CONFIG_DIRS XDG_DATA_DIRS \
	XDG_BIN_DIR XDG_LIB_DIR \
	XDG_DOCUMENTS_DIR XDG_DOWNLOAD_DIR XDG_GAMES_DIR XDG_MEDIA_DIR XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_PROJECTS_DIR XDG_TEMPLATES_DIR XDG_VIDEOS_DIR &>/dev/null

# prepare the environment for starting a graphical session
# $1: PROTOCOL {x11, wayland}
# $2: DESKTOP
function _prepare_graphical_environment { local protocol="$1" desktop="$2"
	if [[ "$protocol" =~ ^(wayland|x11)$ ]]; then
		export CLUTTER_BACKEND="$protocol"
		export DESKTOP_SESSION="$protocol"
		export GDK_BACKEND="$protocol"
		export SDL_VIDEODRIVER="$protocol"
		export WINIT_UNIX_BACKEND="$protocol"
		export XDG_SESSION_TYPE="$protocol"
		case "$protocol" in
			wayland) export QT_QPA_PLATFORM="wayland" _JAVA_AWT_WM_NONREPARENTING=1 ;;
			x11)     export QT_QPA_PLATFORM="xcb"     WINIT_X11_SCALE_FACTOR=1 ;;
		esac
	else
		return 2
	fi
	[[ -n "$desktop" ]] && export XDG_CURRENT_DESKTOP="$desktop" || return 2
	unset -v PARENT_TERM
	# setup the keyboard
	# man:xkeyboard-config(7)
	export XKB_DEFAULT_LAYOUT="us"
	export XKB_DEFAULT_OPTIONS="caps:shiftlock,compose:ralt"
	# setup the cursor
	export XCURSOR_SIZE=24
	export XCURSOR_THEME="Adwaita"
	# enable hardware video acceleration
	# TODO: better detection?
	case "$(lsmod | grep -Eo '^(amdgpu|i915)')" in
		*amdgpu*) export LIBVA_DRIVER_NAME="radeonsi" VDPAU_DRIVER="radeonsi" ;;
		*i915*)   export LIBVA_DRIVER_NAME="iHD"      VDPAU_DRIVER="va_gl" ;;
	esac
	# gtk3 theme for qt5 with qt5ct
	export QT_QPA_PLATFORMTHEME="qt5ct"
	# gtk theme
	export GTK_THEME="Adwaita:dark"
	# import the environment variables to the systemd user session
	systemctl --user import-environment \
		CLUTTER_BACKEND DESKTOP_SESSION GDK_BACKEND QT_QPA_PLATFORM SDL_VIDEODRIVER WINIT_UNIX_BACKEND XDG_SESSION_TYPE \
		XDG_CURRENT_DESKTOP \
		WINIT_X11_SCALE_FACTOR _JAVA_AWT_WM_NONREPARENTING \
		XKB_DEFAULT_LAYOUT XKB_DEFAULT_OPTIONS \
		XCURSOR_SIZE XCURSOR_THEME \
		LIBVA_DRIVER_NAME VDPAU_DRIVER \
		GTK_THEME QT_QPA_PLATFORMTHEME &>/dev/null
	# import the environment variables to dbus
	dbus-update-activation-environment --systemd \
		CLUTTER_BACKEND DESKTOP_SESSION GDK_BACKEND QT_QPA_PLATFORM SDL_VIDEODRIVER WINIT_UNIX_BACKEND XDG_SESSION_TYPE \
		XDG_CURRENT_DESKTOP \
		WINIT_X11_SCALE_FACTOR _JAVA_AWT_WM_NONREPARENTING \
		XKB_DEFAULT_LAYOUT XKB_DEFAULT_OPTIONS \
		XCURSOR_SIZE XCURSOR_THEME \
		LIBVA_DRIVER_NAME VDPAU_DRIVER \
		GTK_THEME QT_QPA_PLATFORMTHEME &>/dev/null
}

IFS='' read -r -d '' <<EOF
\e[1;35m┌────────────────────┐\e[0m
\e[1;35m│ \e[1;34mGraphical Sessions\e[0m \e[1;35m│\e[0m
\e[1;35m├────────────────────┤\e[0m
\e[1;35m│ \e[1;32ms\e[0m\e[1mway\e[0m \e[36m-\e[0m \e[1mwayland\e[0m     \e[1;35m│\e[0m
\e[1;35m│ \e[1;36mc\e[0m\e[1mage\e[0m \e[36m-\e[0m \e[1mwayland\e[0m     \e[1;35m│\e[0m
\e[1;35m├────────────────────┤\e[0m
\e[1;35m│  \e[1;33mConsole Sessions\e[0m  \e[1;35m│\e[0m
\e[1;35m├────────────────────┤\e[0m
\e[1;35m│ \e[1;36mt\e[0m\e[1mmux\e[0m \e[36m-\e[0m \e[1mmultiplexer\e[0m \e[1;35m│\e[0m
\e[1;35m│ \e[1;36mz\e[0m\e[1msh\e[0m  \e[36m-\e[0m \e[1mshell\e[0m       \e[1;35m│\e[0m
\e[1;35m│ \e[1;31mb\e[0m\e[1mash\e[0m \e[36m-\e[0m \e[1mshell\e[0m       \e[1;35m│\e[0m
\e[1;35m├────────────────────┤\e[0m
\e[1;35m│ \e[1;36ml\e[0m\e[1mogout\e[0m             \e[1;35m│\e[0m
\e[1;35m│ \e[1;36mr\e[0m\e[1meboot\e[0m             \e[1;35m│\e[0m
\e[1;35m│ \e[1;36mp\e[0m\e[1moweroff\e[0m           \e[1;35m│\e[0m
\e[1;35m└────────────────────┘\e[0m\e[?25l
EOF
printf "%b" "$REPLY"

trap '' INT
while true; do
	read -s -N1
	case "$REPLY" in
		$'\012'|'s')
			echo -ne "\e[H\e[2J"
			_prepare_graphical_environment wayland sway
			exec systemd-run --user -dqG --scope -usway-session --slice-inherit -- sway
		;;
		'c')
			echo -ne "\e[H\e[2J"
			_prepare_graphical_environment wayland cage
			exec systemd-run --user -dqG --scope -ucage-session --slice-inherit -- \
				cage -ds -mall -- "$XDG_CONFIG_HOME/cage/config.sh"
		;;
		't')
			echo -ne "\e[H\e[2J\e[?25h"
			systemctl --user start tmux-daemon@console.service &>/dev/null
			exec tmux -S "$XDG_RUNTIME_DIR/tmux-console" \
				new-session -A -s login -- bash
		;;
		'z')
			echo -ne "\e[H\e[2J\e[?25h"
			exec zsh
		;;
		$'\004'|'b')
			echo -ne "\e[H\e[2J\e[?25h"
			exec bash
		;;
		'l') logout ;;
		'r') reboot ;;
		'p') poweroff ;;
	esac
done


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
