HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
KEYTIMEOUT=1

setopt extendedglob nomatch
unsetopt beep

autoload -U colors compinit
colors
compinit

bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

PROMPT="%{$fg[blue]%} %% %{$reset_color%}"

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

alias ..='cd .. && pwd'
alias ...='cd ../.. && pwd'
alias ....='cd ../../.. && pwd'
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias v='mvim --remote-silent'

PATH=${HOME}/bin:${PATH}
EDITOR=vim

# Creates an alias that changes to the current directory.
bm() {
  if [ -z "$1" ]; then
    echo "Usage: bm <alias>"
    return 0
  fi
  alias cd$1="cd `pwd`"
}
