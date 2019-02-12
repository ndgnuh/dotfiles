function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo "⚡"; fi
}

# PROMPT='%{$FG[011]%}$ZSH_THEME_MATERIAL_PREFIX%{$fg_bold[cyan]%}%p %{$FG[006]%}%c%B$(git_prompt_info) %{$FG[009]%}$ZSH_THEME_MATERIAL_SUFFIX%{$FG[011]%}$ZSH_THEME_MATERIAL_SUFFIX%{$FG[010]%}$ZSH_THEME_MATERIAL_SUFFIX%b %{$reset_color%}'

PROMPT='%B%F{#80D8FF}  ᚜ %n@%m %F{#A7FFEB}%1~$(git_prompt_info)%F{#80D8FF} ᚛  $(prompt_char) %b%f'
# RPROMPT="$(git_prompt_info)"-
# Customize git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX=":%F{#81C784}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""


