# Emacs mode
bindkey -e

# Configure word completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
# zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Configure command history
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_space

# Enable zoxide (must be installed manually)
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

eval "$(fzf --zsh)"

# Configure colors
autoload -U colors && colors

# Configure prompt
autoload -Uz promptinit && promptinit

PROMPT="%{$fg_bold[blue]%} %% %{$reset_color%}"
RPROMPT="%{$fg[blue]%} %4d %{$reset_color%}"

# Enable C-X C-E to edit command line in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

function my_cd() {
  z $*
  if [[ ! -z "$NVIM" ]]; then
    nvcd .
  fi
}

# Aliases
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias 1='my_cd ..'
alias 2='my_cd ../..'
alias 3='my_cd ../../..'
alias 4='my_cd ../../../..'
alias 5='my_cd ../../../../..'
alias 6='my_cd ../../../../../..'
alias 7='my_cd ../../../../../../..'
alias 8='my_cd ../../../../../../../..'
alias 9='my_cd ../../../../../../../../..'
alias cd='my_cd'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls='ls --color'
  alias n='notify-send "done"'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export CLICOLOR=1
  alias n="osascript -e \"display notification \\\"Done\\\" with title \\\"Done\\\"\""
fi

alias v='nvopen'
alias s='printf "$fg[red]"; repeat $(tput cols) printf "#"; printf $reset_color; print'

function cdv() {
  cd `nvpwd`
}

# Point `npm install -g` to .local, so that npm -g does not require sudo and
# doesn't mess with system.
export npm_config_prefix="$HOME/.local"

# Paths
export GOBIN=${HOME}/go/bin
export PATH="${PATH}:${GOBIN}"
export PATH="${PATH}:${HOME}/config/bin"
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:${HOME}/.cargo/bin"

export EDITOR=$HOME/config/bin/nved
export KUBE_EDITOR=$EDITOR

# Creates an alias that changes to the current directory.
bm() {
  if [ -z "$1" ]; then
    echo "Usage: bm <alias>"
    return 0
  fi
  alias cd$1="cd `pwd`"
}

# https://wiki.archlinux.org/title/Zsh#Key_bindings
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"              beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"               end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"            overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"         backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"            delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"                up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"              down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"              backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"             forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"            beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"          end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"         reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
