#! /bin/bash

# need to do a few things:
# install vim?
# install tmux
# install fzf

### add this directory to .bashrc and .zshrc
if ! grep -Fq "export MYSETUP" ~/.bashrc 
then
  echo "export MYSETUP=$(pwd)" | tee -a ~/.bashrc
fi

if ! grep -Fq "export MYSETUP" ~/.zshrc
then
  echo "export MYSETUP=$(pwd)" | tee -a ~/.zshrc
fi

source ~/.bashrc
source ~/.zshrc


echo ""
echo "***** Setting up tmux *****"
#### setup tmux
# setup .tmux.conf by deleting the existing and create a symlink to the new one
rm ~/.tmux.conf
ln -s $(pwd)/.dotfiles/.tmux.conf ~/.tmux.conf

echo ""
echo "***** Setting up vim *****"
#### setup vim
## for vim, add vimplug
if [ ! -e ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# set up .vimrc
rm ~/.vimrc
ln -s $(pwd)/.dotfiles/.vimrc ~/.vimrc

# set up plugins.vim for ~/.vimr/plugins.vim
rm ~/.vim/plugins.vim
ln -s $(pwd)/vimstuff/plugins.vim ~/.vim/plugins.vim

# set up the ~/.vim/ftplugin folder
rm -rf ~/.vim/ftplugin
mkdir -p ~/.vim/ftplugin
#   create a symlink for each of the .vim files in ftplugin
for file in $(pwd)/vimstuff/ftplugin/*; do
  # $file contains the full path to the file
  filename=$(basename $file);
  echo "creating symlink ~/.vim/ftplugin/$filename -> $file"
  ln -s $file  ~/.vim/ftplugin/$filename;
done

# setup additional plugins to vim
if [ -d ~/.vim/extra-plugins ]
then
  rm -rf ~/.vim/extra-plugins
fi

mkdir -p ~/.vim/extra-plugins
for file in $(pwd)/vimstuff/extra-plugins/*; do
  filename=$(basename $file);
  echo "creating symlink ~/.vim/extra-plugins'$filename -> $file"
  ln -s $file ~/.vim/extra-plugins/$filename
done

# zsh plug-ins

#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc


