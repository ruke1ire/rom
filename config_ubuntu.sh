#!/usr/bin/bash

CONFIG=$HOME/.config/

echo "Creating ~/.config"
mkdir -p $CONFIG
echo "------------------>Linking neovim configuration"
ln -sv $(pwd)/.config/nvim/ $CONFIG
echo "------------------>Linking tmux configuration"
ln -sv $(pwd)/.tmux.conf $HOME/.tmux.conf
echo "------------------>Appending zshrc with tmux and style configuration"
cat append_to_bashrc.sh >> $HOME/.zshrc
echo "------------------>Linking VSCode configuration"
ln -sv $(pwd)/.config/Code $CONFIG

