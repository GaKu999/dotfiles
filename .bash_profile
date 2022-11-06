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
	XDG_BIN_DIR XDG_LIB_DIR &>/dev/null

# import to dbus
dbus-update-activation-environment --systemd \
	PATH \
	SSH_AUTH_SOCK \
	XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
	XDG_CONFIG_DIRS XDG_DATA_DIRS \
	XDG_BIN_DIR XDG_LIB_DIR &>/dev/null

if [[ -z "$SSH_CLIENT" ]]; then
	echo -ne "\e[H\e[2J\e[?25h\e[9;1]"
fi


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
