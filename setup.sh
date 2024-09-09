#!/bin/bash

ln -sf $(realpath .inputrc) ~/.inputrc
ln -sf $(realpath .vimrc) ~/.vimrc
ln -sf $(realpath .vimrc) ~/.ideavimrc
ln -sf $(realpath .vimrc) ~/.vscodevimrc
ln -sf $(realpath .tmux.conf) ~/.tmux.conf
ln -sf $(realpath .tmux.conf.local) ~/.tmux.conf.local

mkdir -p ~/.config/nvim/lua
ln -sf $(realpath .config/nvim/init.vim) ~/.config/nvim/init.vim
ln -sf $(realpath .config/nvim/lua/config.lua) ~/.config/nvim/lua/config.lua

mkdir -p ~/.config/git
ln -sf $(realpath .config/git/ignore) ~/.config/git/ignore

echo "Run the steps below manually:"
echo ""
echo "1.  Install tmux"
echo "2.  Install neovim version >= 0.7 ('nvim' snap in ubuntu >=22.04)"
echo "3.  Add 'alias vim=nvim' to .bashrc"
echo "4.  Add 'export EDITOR=nvim' to .bashrc"
echo "5.  Install vim-plug - https://github.com/junegunn/vim-plug#unix-linux"
echo "6.  Run :PlugInstall"
echo "7.  Install xclip"
echo "8.  Install xsel"
echo "9.  Install sublime-text (snap in ubuntu >=22.04)"
echo "10. Install telegram-desktop (snap in ubuntu >=22.04)"
echo "11. Install vscode ('code' snap in ubuntu >=22.04)"
echo "12. Read vscode.md"

if [ -x "$(command -v nvim)" ]; then
    VIM=nvim
    VIMDIFF=nvimdiff
else
    VIM=vim
    VIMDIFF=vimdiff
fi

git config --global core.excludesfile ~/.config/git/ignore
git config --global credential.helper store
git config --global diff.tool $VIMDIFF
git config --global safe.directory '*'
git config --global core.editor $VIM
git config --global alias.ff 'pull --ff-only'
git config --global alias.continue 'rebase --continue'
git config --global alias.amend 'commit --amend'
git config --global alias.spush 'stash push'
git config --global alias.spop 'stash pop'
git config --global alias.sshow 'stash show'
git config --global alias.sapply 'stash apply'
git config --global alias.slist 'stash list --stat'
git config --global alias.s 'status'
git config --global alias.pull-pr '!f() { git fetch origin pull/$1/head:pr-$1; }; f'
git config --global alias.sdiff 'diff --staged'
git config --global user.email "egorkincbl@gmail.com"
git config --global user.name "Egor Kutovoi"
