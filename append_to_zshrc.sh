#tmux
if [ "$TMUX" = "" ]; then tmux attach || tmux new; fi

# prompt
PS1=' %~$ '

# colored ls
alias ls='ls -G'
alias ll='ls -lG'
