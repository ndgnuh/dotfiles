function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

# PROMPT='%{$FG[011]%}$ZSH_THEME_MATERIAL_PREFIX%{$fg_bold[cyan]%}%p %{$FG[006]%}%c%B$(git_prompt_info) %{$FG[009]%}$ZSH_THEME_MATERIAL_SUFFIX%{$FG[011]%}$ZSH_THEME_MATERIAL_SUFFIX%{$FG[010]%}$ZSH_THEME_MATERIAL_SUFFIX%b %{$reset_color%}'

PROMPT='
%F{#e91e63}[%*] -> %F{#81d4fa}[%n@%m %~$(git_prompt_info)]
%f$(prompt_char) %b'

# Customize git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX=":%F{#9ccc65} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{#81d4fa}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""


