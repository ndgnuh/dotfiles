git_branch() {
	echo "%F{red}$(git branch 2>&1 |
        grep -v "fatal: not a git" | grep \* | awk '{print ":" $2}')%F{cyan}"
}

PROMPT="
%F{magenta}⌈λ⌋ %F{cyan}%1~$(git_current_branch)/%{$reset_color%} "

# if the prompt is longer than
# one third of the terminal width then
# insert a new line

ZSH_THEME_GIT_PROMPT_PREFIX=":"
ZSH_THEME_GIT_PROMPT_PREFIX=":%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_PREFIX=" ("
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
#ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
#ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"
#
#ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"
