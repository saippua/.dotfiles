PROMPT="%(?.%{$fg_bold[green]%}➜ .%{$fg_bold[red]%}➜ )"
PROMPT+="%(!.%{$fg_bold[yellow]%}%n.%{$fg_bold[green]%}%n)"
PROMPT+="%{$fg_bold[white]%}@"
PROMPT+="%{$fg_bold[green]%}%m"
# PROMPT+="%{$fg_bold[red]%}%(5w.[Gotta Get Down].)" # Friday celebration
PROMPT+="%{$fg_bold[white]%}:"
PROMPT+="%{$fg[blue]%}%~%{$reset_color%}"
PROMPT+='$(git_prompt_info)'
PROMPT+="$ "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%} (%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
