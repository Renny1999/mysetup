#!/bin/bash

# need to do a few things:
# install vim?
# install tmux

#### setup tmux
# setup .tmux.conf
cp ./.tmux.conf ~ &&

#### setup vim
## for vim, add vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# set up .vimrc
cp ./.vimrc ~ 


