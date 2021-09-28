#!/bin/bash

# need to do a few things:
# install vim?
# install tmux

#### setup tmux
# setup .tmux.conf
cp ./.tmux.conf ~ &&

#### setup vim
## for vim, add pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &&

## install plugins for vim
# solarized dark    
git clone git://github.com/altercation/vim-colors-solarized.git && \
mv vim-colors-solarized ~/.vim/bundle && \

# set up .vimrc
cp ./.vimrc ~ 


