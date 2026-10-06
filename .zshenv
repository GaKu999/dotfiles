#!/hint/zsh
# vim:ft=zsh:noet:ts=3:sw=3:
# man:zsh(1)#STARTUP/SHUTDOWN FILES
# file:$HOME/.zshenv
#==============================================================================#


set -a
	# XDG user dirs
	: ${XDG_CACHE_HOME:=$HOME/.cache}
	: ${XDG_CONFIG_HOME:=$HOME/.config}
	: ${XDG_DATA_HOME:=$HOME/.share}
	: ${XDG_STATE_HOME:=$HOME/.state}

	: ${XDG_BIN_DIR:=$HOME/.bin}
	: ${XDG_LIB_DIR:=$HOME/.lib}

	XDG_CONFIG_DIRS=$XDG_CONFIG_HOME:$PREFIX/etc/xdg
	XDG_DATA_DIRS=$XDG_DATA_HOME:$PREFIX/share
set +a

# default to dumb
[[ -n $TERM ]] || export TERM="dumb"

# enable 16 color support in the linux console
# bold is bright foreground, blink is bright background
if [[ $TERM =~ linux ]] {
	export TERM="linux-16color"
}

# always use 256color
if [[ $TERM =~ xterm ]] {
	export TERM="xterm-256color"
}

# setup $PATH
typeset -U path PATH
path=($path $XDG_BIN_DIR)
export PATH

if [[ -o interactive ]] {
	# color setup
	setaf=( ${(f)"$( printf 'setaf %s\nind\n' {0..255} | tput -S 2> /dev/null )"} )
	setab=( ${(f)"$( printf 'setab %s\nind\n' {0..255} | tput -S 2> /dev/null )"} )
	readonly setaf setab

	# $1: CODE {1..256}
	function setaf { local -ir i=$argv[1] ; echo -n $setaf[$i] }
	function setab { local -ir i=$argv[1] ; echo -n $setab[$i] }

	# plain color codes
	_af=( ${(f)"$( printf '%s\n' $setaf | tr -d '\033[m' )"} )
	_ab=( ${(f)"$( printf '%s\n' $setab | tr -d '\033[m' )"} )
	readonly _af _ab
}


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
