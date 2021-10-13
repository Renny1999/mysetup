#!/bin/bash

# need to do a few things:
# install vim?
# install tmux

### add this directory to .bashrc and .zshrc
echo "export MYSETUP=$(pwd)" | tee -a ~/.bashrc
echo "export MYSETUP=$(pwd)" | tee -a ~/.zshrc
source ~/.zshrc
source ~/.bashrc

#### setup tmux
# setup .tmux.conf by deleting the existing and create a symlink to the new one
rm ~/.tmux.conf
ln -s $(pwd)/.dotfiles/.tmux.conf ~/.tmux.conf


#### setup vim
## for vim, add vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# set up .vimrc
rm ~/.vimrc
ln -s $(pwd)/.dotfiles/.vimrc ~/.vimrc

# zsh plug-ins

#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc


