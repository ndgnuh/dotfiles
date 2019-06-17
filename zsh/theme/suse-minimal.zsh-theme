git_branch() {
	echo "%F{green}$(git branch 2>&1 | grep -v "fatal: not a git" | grep \* | awk '{print ":" $2}')%F{blue}"
}

PROMPT='%F{blue}%1~$(git_branch)/ %f> '
RPROMPT=''
