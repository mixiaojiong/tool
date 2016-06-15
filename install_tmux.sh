#!/bin/bash

sudo yum install -y gcc kernel-devel make ncurses-devel

wget http://www.monkey.org/~provos/libevent-2.0.10-stable.tar.gz
tar -xvzf libevent-2.0.10-stable.tar.gz
cd libevent-2.0.10-stable
./configure --prefix=/usr/local
make
sudo make install

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure
--prefix=/usr/local
make
sudo make install
pkill tmux
tmux -V
cp .tmux.conf ~/.tmux.conf
