autoload -U colors && colors
autoload -U compinit && compinit

# Emacs mode
bindkey -e

zstyle ':completion:*' menu select
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Enable C-X C-E to edit command line in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

PROMPT="%{$fg[blue]%} %% %{$reset_color%}"

alias ls='ls --color'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias 1='cd ..'
alias 2='cd ../..'
alias 3='cd ../../..'
alias 4='cd ../../../..'
alias 5='cd ../../../../..'
alias 6='cd ../../../../../..'
alias 7='cd ../../../../../../..'
alias 8='cd ../../../../../../../..'
alias 9='cd ../../../../../../../../..'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias v='gvim --remote-silent'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias v='mvim --remote-silent'
fi
alias s='printf "$fg[red]"; repeat $(tput cols) printf "#"; printf $reset_color; print'

export PATH=$HOME/bin:$PATH
export EDITOR=vim
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=00;34:ln=00;35:so=00;32:pi=00;33:ex=00;31'
export GREP_COLOR='1;33'

# Creates an alias that changes to the current directory.
bm() {
  if [ -z "$1" ]; then
    echo "Usage: bm <alias>"
    return 0
  fi
  alias cd$1="cd `pwd`"
}

grepcc() {
  grep -r --include=\*.cc --include=\*.h --include=\*.mm --include=\*.m $1 *
}

if [[ -f ~/.local_zshrc ]]; then
  source ~/.local_zshrc
fi
