if [ "$EUID" -ne 0 ]; then
	PROMPT='%K{green}%F{black} %1~$(git_prompt_info) %k %F{green} $%f '
else
	PROMPT='%K{red}%F{white} %1~$(git_prompt_info) %k %F{red} #%f '
fi
# PROMPT='%K{blue}%F{black} %n@%m %F{black}%K{green} %1~$(git_prompt_info) %f%k %F{green}%#%f '

ZSH_THEME_GIT_PROMPT_PREFIX='/'
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_DIRTY=' %K{red}%F{white} ✗'
ZSH_THEME_GIT_PROMPT_CLEAN='' 
