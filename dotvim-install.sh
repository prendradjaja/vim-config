#!/usr/bin/env bash
set -e
cd ~
git clone https://github.com/prendradjaja/vim-config.git ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update
