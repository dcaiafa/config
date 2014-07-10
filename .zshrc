export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_CUSTOM=$HOME/config/oh-my-zsh/custom

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias v='mvim --remote-silent'
alias s='printf "$fg[red]"; repeat $(tput cols) printf "#"; printf $reset_color; print'

export PATH=$HOME/bin:$PATH
export EDITOR=vim

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
