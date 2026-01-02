#!/hint/zsh
# vim:ft=zsh:noet:ts=3:sw=3:
# man:zsh(1)#STARTUP/SHUTDOWN FILES
# file:$HOME/.zshenv
#==============================================================================#


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
path=($path $HOME/.bin)
export PATH

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


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
