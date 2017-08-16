#!/bin/bash

mkdir -p ~/.vim
cp -r vimrc vimrc.d ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "source ~/.vim/vimrc" >> ~/.vimrc
vim +PluginInstall +qall
