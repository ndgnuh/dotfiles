git_branch() {
	if [ -d .git ]; then
		echo "%F{green}:$(git branch | grep \* | awk '{print $2}')%F{blue}"
	fi
}

PROMPT='%F{blue}%1~$(git_branch)/ %f> '
RPROMPT=''
