zmodload zsh/zprof
. /etc/profile
umask 022

# HELPER
prepend_path () {
	if [ -d "$1" ]; then
		export PATH="$1:$PATH"
	fi
}

source_if_exist() {
	if [ -f "$1" ]; then
		source $1
	fi

}

# Julia daemon mode
alias juliaserver='julia --startup-file=no -e "using DaemonMode; serve()" & disown'
juliaclient() {
  if [ "$1" = "-e" ]; then
    shift 1
    julia --startup-file=no -e 'using DaemonMode; runexpr("'$@'")'
  else
    julia --startup-file=no -e "using DaemonMode; runargs()" $@
  fi
}

# ANDROID


export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
# export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
# export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
prepend_path "$ANDROID_HOME/cmdline-tools/latest/bin" 
prepend_path "$ANDROID_HOME/platform-tools"
prepend_path "$ANDROID_HOME/tools"
prepend_path "$ANDROID_HOME/tools/bin"
prepend_path "$ANDROID_HOME/emulator/bin64"
prepend_path "$ANDROID_HOME/emulator"

zmodload zsh/zprof
# HISTORY

export HISTFILE=$HOME/.cache/history
export SAVEHIST=1000
export HISTSIZE=1000


# CUSTOM PATH

export PATH=$PATH:/home/hung/.local/bin
export PATH=$PATH:/home/hung/.yarn/bin
# export APPLICATION_DIR=$HOME/Application
# for d in $APPLICATION_DIR/*; do
# 	if ! [ -d $d/bin ]; then
# 		# NO BIN FOLDER
# 		continue
# 	elif [ -f $d/bin/python ]; then
# 		# SKIP PYTHON VIRTUALENV
# 		continue
# 	fi
# 	export PATH=$PATH:$d/bin
# done


# PROMPT
export PS1="%B%F{green}%n@%m%f:%F{blue}%1c%f$%b "

# Remove / from list of character recognized as word
export WORDCHARS=${WORDCHARS/\/}


# RESOURCE SHELL
src () {
	exec zsh
}


# KEYBINDING
# https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/key-bindings.zsh
# {{{
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Use vim key bindings
bindkey -v

# [PageUp] - Up a line of history
if [[ -n "${terminfo[kpp]}" ]]; then
  bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
  bindkey -M viins "${terminfo[kpp]}" up-line-or-history
  bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi
# [PageDown] - Down a line of history
if [[ -n "${terminfo[knp]}" ]]; then
  bindkey -M emacs "${terminfo[knp]}" down-line-or-history
  bindkey -M viins "${terminfo[knp]}" down-line-or-history
  bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${terminfo[kcuu1]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${terminfo[kcud1]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  bindkey -M viins "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}"  end-of-line
  bindkey -M viins "${terminfo[kend]}"  end-of-line
  bindkey -M vicmd "${terminfo[kend]}"  end-of-line
fi

# [Shift-Tab] - move through the completion menu backwards
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Backspace] - delete backward
bindkey -M emacs '^?' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M vicmd '^?' backward-delete-char
# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "${terminfo[kdch1]}" delete-char
  bindkey -M viins "${terminfo[kdch1]}" delete-char
  bindkey -M vicmd "${terminfo[kdch1]}" delete-char
else
  bindkey -M emacs "^[[3~" delete-char
  bindkey -M viins "^[[3~" delete-char
  bindkey -M vicmd "^[[3~" delete-char

  bindkey -M emacs "^[3;5~" delete-char
  bindkey -M viins "^[3;5~" delete-char
  bindkey -M vicmd "^[3;5~" delete-char
fi

# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word


bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey ' ' magic-space                               # [Space] - don't do history expansion


# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# file rename magick
bindkey "^[m" copy-prev-shell-word

# FZF
if [ -e /usr/share/doc/fzf/key-bindings.zsh ]; then
	source /usr/share/doc/fzf/key-bindings.zsh
	bindkey "^p" fzf-file-widget
	# bindkey "^P" fzf-cd-widget
	bindkey "^r" fzf-history-widget
fi
# }}}

# ALIAS
alias ls="ls -h --color=auto"
alias l="ls -lh --color=auto"
alias feh="feh --scale-down"
# if command -v rg &> /dev/null; then
# 	alias grep="rg"
# fi


# FUZZY MATCHING {{{
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
# }}}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


if ! [ $(command -v python) ]; then
	alias python=python3
fi
# PERL STUFF
# PATH="/home/hung/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/hung/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/hung/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/hung/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/hung/perl5"; export PERL_MM_OPT;

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# conda() {
# 	unset conda
# 	eval "$(/home/hung/Application/miniconda3/bin/conda shell.zsh hook)"
# 	__conda_setup="$('/home/hung/Application/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# 	if [ $? -eq 0 ]; then
# 		eval "$__conda_setup"
# 	else
# 		if [ -f "/home/hung/Application/miniconda3/etc/profile.d/conda.sh" ]; then
# 			. "/home/hung/Application/miniconda3/etc/profile.d/conda.sh"
# 		else
# 			export PATH="/home/hung/Application/miniconda3/bin:$PATH"
# 		fi
# 	fi
# 	unset __conda_setup
# 	conda $@
# }
# <<< conda initialize <<<


# PYTHON

# export PYENV_ROOT=$HOME/Application/pyenv/
# export PYENV_VERSION=3.8.12
# eval "$(pyenv init --path)"


# TEXLIVE
export TEXHOME=$HOME/Application/texlive
if [ -d $TEXHOME ]; then
	export TEXDIR=$TEXHOME/2021
	export TEXMFLOCAL=$TEXHOME/texmf-local
	export TEXMFSYSVAR=$TEXHOME/2021/texmf-var
	export TEXMFSYSCONFIG=$TEXHOME/texmf-config
	export TEXMFVAR=$TEXMFSYSVAR
	export TEXMFCONFIG=$TEXMFSYSCONFIG
	export TEXMFHOME=$TEXHOME/texmf
	export PATH=$PATH:$TEXDIR/bin/x86_64-linux
	export MANPATH=$MANPATH:/home/hung/Application/texlive/2021/texmf-dist/doc/man
	export INFOPATH=$INFOPATH:/home/hung/Application/texlive/2021/texmf-dist/doc/info
fi

# REMOVE THE % EOL
unsetopt prompt_cr prompt_sp

# SSH AGENT
ssh-init () {
	eval $(ssh-agent -s | grep -v echo)
	for f in $HOME/.ssh/*id_rsa; do
		ssh-add $f
	done
}

# GIT ALIAS
alias gc='git commit -v'
alias gcm='git commit -v -m'
alias ga='git add'
alias gpsh='git push'
alias gpll='git pull'
alias gco='git pull'

# NVIM PATH
prepend_path "$HOME/.local/share/neovim/bin"

# NODE
source_if_exist /home/hung/.lazy_node_loader.sh

export JULIA_DEPOT_PATH=$HOME/.cache/julia
prepend_path "$HOME/.cache/julia/bin/"



# CARGO, if exists
if [ -f $HOME/.cargo/env ]; then
  . $HOME/.cargo/env
fi


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/hung/.cache/julia/juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<


export EDITOR=nvim

if [ -d ~/.zshd ]; then
  for f in $(ls ~/.zshd); do
    source ~/.zshd/$f
  done
fi
fpath+=~/.zfunc
