#!/bin/sh
# A script that writes dotfiles from this repository to the system. 

echo 'writing dotfiles from repository to system'

cp .vimrc ~/.vimrc
cp .gitconfig ~/.gitconfig
cp .zshrc ~/.zshrc
cp .ctags ~/.ctags
cp .tmux.conf ~/.tmux.conf
cp sshconfig ~/.ssh/config

mkdir -p ~/.vim/after/ftplugin
cp -a after/ftplugin/ ~/.vim/after/ftplugin

echo 'Done'

