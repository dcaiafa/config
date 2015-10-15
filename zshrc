# Emacs mode
bindkey -e

# Configure word completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
# zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Configure command history
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_space

# Configure colors
autoload -U colors && colors

# Configure prompt
PROMPT="%{$fg_bold[blue]%} %% %{$reset_color%}"
RPROMPT="%{$fg[blue]%} %4d %{$reset_color%}"

# Enable C-X C-E to edit command line in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Aliases
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
  alias ls='ls --color'
  alias n='notify-send "done"'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export CLICOLOR=1
  alias n="osascript -e \"display notification \\\"Done\\\" with title \\\"Done\\\"\""
fi
alias v='nvopen'
alias s='printf "$fg[red]"; repeat $(tput cols) printf "#"; printf $reset_color; print'

# Environment variables
export PATH=$HOME/config/bin:$PATH
export EDITOR=$HOME/config/bin/nved

# Creates an alias that changes to the current directory.
bm() {
  if [ -z "$1" ]; then
    echo "Usage: bm <alias>"
    return 0
  fi
  alias cd$1="cd `pwd`"
}

dgrep() {
  if [[ -z $1 ]]; then
    echo "Usage: dgrep [-r] <file-extension>+ -- <text-to-search>"
    return 1
  fi

  recurse_flag=''
  include_flags=''
  files=()
  while true; do
    if [[ -z $1 ]]; then
      echo "Missing --" >&2
      return 1
    elif [[ $1 == "-r" ]]; then
      recurse_flag='-r'
      shift
    elif [[ $1 == '--' ]]; then
      shift
      break
    else
      if [[ -z $recurse_flag ]]; then
        files+=(*.$1)
      else
        include_flags="${include_flags} --include=*.$1"
      fi
      shift
    fi
  done

  if [[ -z $1 ]]; then
    echo "Missing string after --" >&2
    return 1
  fi

  if [[ -z $files ]]; then
    files+=(*)
  fi

  grep -H ${recurse_flag} ${=include_flags} $1 ${=files}
}

if [[ -f ~/.local_zshrc ]]; then
  source ~/.local_zshrc
fi
