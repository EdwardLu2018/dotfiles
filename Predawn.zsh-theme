# Modified from: https://github.com/jamiewilson/predawn-shell

git_status() {
  if ! __git_prompt_git rev-parse --git-dir &> /dev/null \
    || [[ "$(__git_prompt_git config --get oh-my-zsh.hide-info 2>/dev/null)" == 1 ]]; then
    return 0;
  fi

  local hide_dirty
  hide_dirty=$(git config --get oh-my-zsh.hide-dirty)
  if [[ -z $hide_dirty || $hide_dirty == 0 ]]; then
    local dirty
    dirty=$(parse_git_dirty)
    if [[ -n $dirty ]]; then
        echo " %{$fg[yellow]%}$(git_prompt_info)"
    else
      echo " %{$fg[green]%}$(git_prompt_info)"
    fi
  else
    echo " %{$fg[red]%}$(git_prompt_info)"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ±"

local pwd='%{$fg[blue]%}%2~%{$reset_color%}'
local git_branch='$(git_status)%{$reset_color%}'
PROMPT="[${pwd}${git_branch}] "
