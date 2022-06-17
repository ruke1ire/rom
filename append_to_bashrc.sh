# opens tmux as default
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
            tmux attach -t default || tmux new -s default
fi

#changes the prompt
PS1=" \[\$(if [ \$? == 0 ]; then echo -e \"\\e[0;92m\"; else echo -e \"\\e[0;91m\"; fi)\]●\[\e[0m\] \[\033[01;34m\]\w\[\033[00m\]\$ "
