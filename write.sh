#!/bin/sh
# A script that writes dotfiles from this repository to the system. 

echo 'writing dotfiles from repository to system'

cp .vimrc ~/.vimrc
cp .gitconfig ~/.gitconfig
cp .zshrc ~/.zshrc

echo 'Done'

