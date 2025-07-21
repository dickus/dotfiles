PROMPT=' %{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)'
PROMPT+="%(?:%{$fg_bold[blue]%}> %{$reset_color%}:%{$fg_bold[red]%}> )%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}[%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}] %{$fg[red]%}X"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}]"
