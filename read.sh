#!/bin/sh
# A script that copies the dotfiles from my computer to this repository.

echo 'copying dotfiles from system in repository'

cp ~/.vimrc .
cp ~/.gitconfig .
cp ~/.zshrc .
cp ~/.ctags .
cp ~/.tmux.conf .
cp ~/.ssh/config sshconfig

mkdir -p after/ftplugin
cp -a ~/.vim/after/ftplugin/ after/ftplugin

echo 'Done'

