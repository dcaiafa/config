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

# Disable some oh-my-zsh's git functionality for dramatic performance improvement.
git_prompt_status() {
}

if [[ -f ~/.local_zshrc ]]; then
  source ~/.local_zshrc
fi
