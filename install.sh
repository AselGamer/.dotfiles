#!/usr/bin/env bash

if [ $(id -u) = 0 ]; then
	echo "Running as root is not supported." 
	exit 1
fi

echo "Updating the .bashrc."
last_line=$(tail -n 1 ~/.bashrc)
if [ "$last_line" = "# END OF BASHRC" ]; then
	echo "The .bashrc is already updated."; 
else
	# Not uploading the whole bashrc to make it distro independent
	echo "# enable color support of ls and also add handy aliases
	if [ -x /usr/bin/dircolors ]; then
		test -r ~/.dircolors && eval \"\$(dircolors -b ~/.dircolors)\" || eval \"\$(dircolors -b)\"
		alias ls='ls --color=auto'
		#alias dir='dir --color=auto'
		#alias vdir='vdir --color=auto'

		alias grep='grep --color=auto'
		#alias fgrep='fgrep --color=auto'
		#alias egrep='egrep --color=auto'
	fi

	# colored GCC warnings and errors
	#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

	# enable programmable completion features (you don't need to enable
	# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
	# sources /etc/bash.bashrc).
	if ! shopt -oq posix; then
	  if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	  elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	  fi
	fi

	. ~/.bash_profile

	. \"\$HOME/.local/bin/env\"

	# Get color support for 'less'
	export LESS=\"--RAW-CONTROL-CHARS\"

	# Use colors for less, man, etc.
	[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

	# Start tmux by default if tmux is install and is not running inside itself
	if command -v tmux &> /dev/null && [ -n \"\$PS1\" ] && [[ ! \"\$TERM\" =~ screen ]] && [[ ! \"\$TERM\" =~ tmux ]] && [ -z \"\$TMUX\" ]; then
	  exec tmux
	fi
	# END OF BASHRC" >> .bashrc;
fi

echo "Copying config files..."
# TODO: Automate it
# Can't be a symlink
cp --parents ./to_be_copied/bash_profile ../.bash_profile
cp --parents ./to_be_copied/tmux.conf ../.tmux.conf
cp --parents ./to_be_copied/kitty ../.config/
cp --parents ./to_be_copied/i3.conf ../.config/i3/config
