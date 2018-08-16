#!/bin/sh
# A script that copies the dotfiles from my computer to this repository.

echo 'copying dotfiles from system in repository'

cp ~/.vimrc .
cp ~/.gitconfig .
cp ~/.zshrc .

echo 'Done'

