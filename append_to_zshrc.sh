#tmux
if [ "$TMUX" = "" ]; then tmux attach || tmux new; fi

# prompt
PROMPT='%F{green}● %F{white}%~%f%F{226}￥%f '

# colored ls
alias ls='ls -G'
alias ll='ls -lG'
