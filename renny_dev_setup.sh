#!/bin/bash

# need to do a few things:
# install vim?
# install tmux

#### setup tmux
# setup .tmux.conf
cp ./.dotfiles/.tmux.conf ~ 

#### setup vim
## for vim, add vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# set up .vimrc
cp ./.dotfiles/.vimrc ~ 

# zsh plug-ins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc


