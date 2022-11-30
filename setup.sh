#!/bin/bash

ln -sf $(realpath .inputrc) ~/.inputrc
ln -sf $(realpath .vimrc) ~/.vimrc
ln -sf $(realpath .tmux.conf) ~/.tmux.conf
ln -sf $(realpath .tmux.conf.local) ~/.tmux.conf.local

mkdir -p ~/.config/nvim
ln -sf $(realpath .config/nvim/init.vim) ~/.config/nvim/init.vim
