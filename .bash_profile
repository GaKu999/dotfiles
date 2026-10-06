#!/hint/bash
# vim:ft=bash:noet:ts=3:sw=3:
# man:bash(1)#INVOCATION
# file:$HOME/.bash_profile
#==============================================================================#


. "$HOME/.bashenv" || return # broken

[[ "$-" == *i* ]] || return # what nonsense are you doing?

. "$HOME/.bashrc" || return # broken


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
