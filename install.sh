#!/bin/bash
# zsh
sudo yum install vim-enhanced
sudo yum install -y zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# tmux
sudo sh install_tmux.sh
# vim
ln .vimrc ~/.vimrc
ln .vimrc.bundles ~/.vimrc.bundles
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
