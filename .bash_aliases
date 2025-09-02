# some more ls aliases
alias ls='ls --color=auto'
alias l='ls -CFla'
alias ll='ls -l'
alias la='ls -A'

# alias neovim to vim
alias vim="nvim"

# alias python3 to python
alias python="python3"

# cd aliases
alias ..="cd .."
alias ...="cd ..; cd .."
alias ....="cd ..; cd ..; cd .."

alias weather="curl wttr.in/Bilbao?AnQm"

# if fdfind is present alias it to fd
if [ -f /usr/bin/fdfind ]; then 
	alias fd="fdfind"
fi
