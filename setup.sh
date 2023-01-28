#!/bin/bash

ln -sf $(realpath .inputrc) ~/.inputrc
ln -sf $(realpath .vimrc) ~/.vimrc
ln -sf $(realpath .tmux.conf) ~/.tmux.conf
ln -sf $(realpath .tmux.conf.local) ~/.tmux.conf.local

mkdir -p ~/.config/nvim
ln -sf $(realpath .config/nvim/init.vim) ~/.config/nvim/init.vim

mkdir -p ~/.config/git
ln -sf $(realpath .config/git/ignore) ~/.config/git/ignore

echo "Install neovim version >= 0.7!"

git config --global core.excludesfile ~/.config/git/ignore
git config --global diff.tool nvimdiff
git config --global alias.ff 'pull --ff-only'

