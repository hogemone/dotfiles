#!/usr/bin/sh

cdpath=(.. ~)

export LC_ALL=C
export LANG=C

export HISTFILE=~/.history/history.`date +%y%m%d%H%M`
export HISTSIZE=10000
export SAVEHIST=10000
export LISTMAX=0
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export EDITOR=vim
export CVSEDITOR=vim
export PERL_BADLANG=0
export TERM=xterm

autoload -U compinit
compinit
autoload -U colors
colors

setopt auto_list
setopt auto_pushd
setopt list_packed
setopt nolistbeep
setopt append_history
setopt extended_history
setopt magic_equal_subst
setopt print_eight_bit
setopt ignore_eof
setopt multios
setopt EXTENDED_GLOB
setopt RM_STAR_WAIT

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*default' menu select=1
bindkey -e
bindkey "^R" history-incremental-search-backward

setopt PROMPT_SUBST
if [ $UID = 0 ] ; then
    PSCOLOR='01;04;31'
fi
PROMPT=$'%{\e[${PSCOLOR}m%}[%n@%m]%{\e[00m%}# '
RPROMPT=$'%{\e[${PSCOLOR}m%}[%~ %T]%{\e[00m%}'

alias  sl='ls -Fa'
alias  ls='ls -Fa'
alias  la='ls -a'
alias  ll='ls -la'
alias  dir='dir -pa'
alias  rm='rm -i'
alias  cp='cp -i'
alias  mv='mv -i'
alias  vi='vim'
alias  less='lv'
alias  grep='grep --color=auto'
