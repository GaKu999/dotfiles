#!/hint/zsh
# vim:ft=zsh:noet:ts=3:sw=3:
# man:zsh(1)
# file:$HOME/.zshenv
#==============================================================================#


set -a
# man:environment.d(5)
eval $(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

# XDG user dirs
: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_DATA_HOME:=$HOME/.local/share}
: ${XDG_STATE_HOME:=$HOME/.local/state}

: ${XDG_CONFIG_DIRS:=$XDG_CONFIG_HOME:/etc/xdg}
: ${XDG_DATA_DIRS:=$XDG_DATA_HOME:/usr/local/share:/usr/share}

: ${XDG_BIN_DIR:=$HOME/.local/bin}
: ${XDG_LIB_DIR:=$HOME/.local/lib}

: ${XDG_DOCUMENTS_DIR:=$HOME/Documents}
: ${XDG_DOWNLOAD_DIR:=$HOME/Downloads}
: ${XDG_GAMES_DIR:=/var/games}
: ${XDG_MEDIA_DIR:=/run/media/$USER}
: ${XDG_MUSIC_DIR:=$HOME/Music}
: ${XDG_PICTURES_DIR:=$HOME/Pictures}
: ${XDG_PROJECTS_DIR:=$HOME/Projects}
: ${XDG_TEMPLATES_DIR:=$HOME/Templates}
: ${XDG_VIDEOS_DIR:=$HOME/Videos}
set +a

# defaults
export DIFFPROG="diff -dNu"
export EDITOR="nvim"
export PAGER="less"
export VISUAL="nvim"

# man:man(1)
export MANPAGER="nvim +Man!"
export MANWIDTH=80

# man:less(1)
export LESS="-RinF -x3 -~ --wordwrap --incsearch --mouse --no-histdups"
export LESSHISTSIZE=10000

# man:ssh(1)
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh

# define $PARENT_TERM
if [[ $TERM == foot* || -z $PARENT_TERM ]] {
	export PARENT_TERM=$TERM
}

# corrent $TERM
case $PARENT_TERM {
	foot*)
		case $TERM {
			xterm*) export TERM="xterm-256color" ;;
			tmux*)  export TERM="tmux-256color" ;;
		}
	;;
	linux*)
		case $TERM {
			xterm*) export TERM="xterm" ;;
			tmux*)  export TERM="tmux" ;;
		}
	;;
}

# setup $PATH
typeset -U path PATH
path=($XDG_BIN_DIR/.overrides $path $XDG_BIN_DIR)
export PATH


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
