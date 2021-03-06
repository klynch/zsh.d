#! /usr/bin/env zsh

function set_locale() {
	#TODO should check if $1 in `locale -a` first
	#Possible choices: C, POSIX, en_US.UTF-8
	export LANG=${1:-en_US.UTF-8}
	export LC_ALL=${1:-en_US.UTF-8}

	#TODO have -a flag to set all explicitly:
	#     export LC_CTYPE=${loc:-C}
	#     export LC_NUMERIC=${loc:-C}
	#     export LC_TIME=${loc:-C}
	#     export LC_MESSAGES=C
	#     export LC_COLLATE=C
	#     export LC_MONETARY=${loc:-C}
	#     export LC_PAPER=${loc:-C}
	#     export LC_NAME=${loc:-C}
	#     export LC_ADDRESS=${loc:-C}
	#     export LC_TELEPHONE=${loc:-C}
	#     export LC_MEASUREMENT=${loc:-C}
	#     export LC_IDENTIFICATION=${loc:-C}
}

set_locale

typeset -xT PKG_CONFIG_PATH pkg_config_path
typeset -T INFOPATH infopath
typeset -U path manpath infopath pkg_config_path

path=( \
	/usr/local/bin \
	/usr/bin \
	/bin \
	$path)

manpath=( \
	/usr/local/man \
	/usr/man \
	/usr/share/man \
	$manpath)

## for root add sbin dirs to path
if (( EUID == 0 )); then
	path=( \
		/sbin \
		/usr/sbin \
		/usr/local/sbin \
		/opt/local/sbin(N) \
		$path)
fi

#LESS Options (case matters for options)
# --LONG-PROMPT          Status line at bottom
# --LINE-NUMBERS         Numbers on left side
# --SILENT               No Bell
# --RAW-CONTROL-CHARS    Displays only ANSI Color escape sequences
# --squeeze-blank-lines  Causes consecutive blank lines to be squeezed into a single blank line
# --chop-long-lines      Causes lines longer than the screen width to be chopped rather than folded
export LESS="--LONG-PROMPT --SILENT --RAW-CONTROL-CHARS --chop-long-lines"

export VISUAL=vim # export VISUAL=${VISUAL:-vim}
export EDITOR=vim # export EDITOR=${EDITOR:-vim}
export PAGER=less # export PAGER=${PAGER:-less}


	# if test -z "$TERMINFO"; then
	# 	export TERMINFO=$HOME/.config/terminfo
	# 	export TERM=$TERM
	# fi

	## make less colourful
	#export LESS_TERMCAP_mb=$'\E[01;31m'
	#export LESS_TERMCAP_md=$'\E[01;31m'
	#export LESS_TERMCAP_me=$'\E[0m'
	#export LESS_TERMCAP_se=$'\E[0m'
	#export LESS_TERMCAP_so=$'\E[01;44;33m'
	#export LESS_TERMCAP_ue=$'\E[0m'
	#export LESS_TERMCAP_us=$'\E[01;32m'
