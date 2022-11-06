#!/hint/zsh
# vim:ft=zsh:noet:ts=3:sw=3:
# man:zsh(1)
# file:$HOME/.zprofile
#==============================================================================#


# import to systemd
systemctl --user import-environment \
	PATH \
	XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
	XDG_CONFIG_DIRS XDG_DATA_DIRS \
	XDG_BIN_DIR XDG_LIB_DIR &>/dev/null

# import to dbus
dbus-update-activation-environment --systemd \
	PATH \
	XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
	XDG_CONFIG_DIRS XDG_DATA_DIRS \
	XDG_BIN_DIR XDG_LIB_DIR &>/dev/null

if [[ -z $SSH_CLIENT ]] {
	echo -ne "\e[H\e[2J\e[?25h\e[9;1]"
}


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
