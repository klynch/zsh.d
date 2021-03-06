#! /usr/bin/env zsh

#Borrowed heavily from: http://madism.org/~madcoder/dotfiles/zshrc

#LFS Guide
#http://www.linuxfromscratch.org/blfs/view/6.3/postlfs/profile.html

#Also resources:
# http://grml.org/zsh/zsh-lovers.html
# http://cheat.errtheblog.com/s/zsh/
# http://www.rayninfo.co.uk/tips/zshtips.html
# http://github.com/davedash/zsh.d
# http://github.com/bradx3/dotfiles/blob/master/.zshrc


#These are especially USEFUL
# http://adamspiers.org/computing/zsh/
# http://matt.blissett.me.uk/linux/zsh/zshrc

autoload -U compinit zrecompile

function _zsh_main() {
	local zsh_cache zshrc_snipplet
	setopt extended_glob

	zsh_cache=${HOME}/.cache/zsh
	test -d $zsh_cache -a -w $zsh_cache || mkdir -p $zsh_cache

	if [ $UID -eq 0 ]; then
    	compinit
	else
		compinit -d $zsh_cache/zcomp-$HOST

		for f in ~/.zshrc $zsh_cache/zcomp-$HOST; do
			zrecompile -p $f && rm -f $f.zwc.old
		done
	fi

	for f in ~/.zsh.d/[0-9][0-9]-*; do
		source $f
	done
}
_zsh_main

#http://zsh.sourceforge.net/Doc/Release/zsh_8.html
#typeset -T FPATH fpath
# fpath=(~/.zsh.d/zfunc.d $fpath)
# typeset -U fpath
# 
# autoload ~/.zsh.d/zfunc.d/*(N.)
