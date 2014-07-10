PROMPT='%{$fg[blue]%} %% %{$reset_color%}'
# $(_user_host)${_current_dir} $(git_prompt_info) $(_ruby_version)
# ▶ '

# PROMPT2='%{$fg[grey]%}◀%{$reset_color%} '

RPROMPT='${_current_dir} $(git_prompt_info)$(git_prompt_status)'

local _current_dir="%{$fg[gray]%}%3~%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=" "

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[grey]%}"

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=00;34:ln=00;35:so=00;32:pi=00;33:ex=00;31'
export GREP_COLOR='1;33'
