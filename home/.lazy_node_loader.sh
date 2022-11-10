init_node() {
	cmd="$1"
	unset -f node
	unset -f nvm
	unset -f npm
	unset -f npx
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	$@
}

nvm() { init_node nvm }
node() { init_node node }
npm() { init_node npm }
npx() { init_node npx }
