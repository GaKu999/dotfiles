#!/bin/sh
# vim:ft=sh:noet:ts=3:sw=3:
# file:$XDG_CONFIG_HOME/cage/config.sh
#==============================================================================#


systemctl --user import-environment DISPLAY WAYLAND_DISPLAY
dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY
systemctl --user start cage-session.target
exec foot


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
