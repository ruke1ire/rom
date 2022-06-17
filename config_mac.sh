#!/bin/zsh

CONFIG=$HOME/.config/

echo "Creating ~/.config"
mkdir -p $CONFIG
echo "------------------>Linking neovim configuration"
ln -sv $(pwd)/.config/nvim/ $CONFIG
echo "------------------>Linking tmux configuration"
ln -sv $(pwd)/.tmux.conf $HOME/.tmux.conf
echo "------------------>Appending zshrc with tmux and style configuration"
cat append_to_zshrc.sh >> $HOME/.zshrc
echo "------------------>Linking VSCode configuration"
ln -sv $(pwd)/.config/Code/ $CONFIG
echo "------------------>Linking zathura configuration"
ln -sv $(pwd)/.config/zathura/ $CONFIG
