#!/bin/bash
# zsh
sudo yum install -y zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# tmux
sh install_tmux.sh
# vim
cp .vimrc ~/.vimrc
cp .vimrc.bundles ~/.vimrc.bundles
