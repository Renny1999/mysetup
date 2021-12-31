#! /bin/zsh

# need to do a few things:
# install vim?
# install tmux
# install fzf

# first, figure out vim or nvim
# default is vim
vimdir=$HOME/.vim
vimconf=$HOME/.vimrc

if [ $# -eq 0 ]; then
  echo "vim or nvim"
  exit 1
fi

if [ $1 = 'vim' ]; then
  echo "SELECTED VIM"
  vimdir=$HOME/.vim
  vimconf=$HOME/.vimrc
fi

if [ $1 = 'nvim' ]; then
  echo "SELECTED NVIM"
  vimdir=$HOME/.local/share/nvim
  vimconf=$HOME/.config/nvim/init.vim
  echo $vimconf
fi

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
if [ $1 = 'vim' ]; then
  if [ ! -e ~/.vim ]; then
    echo "$vimdir not found"
    mkdir -p $vimdir
  fi
  if [ ! -e ~/.vim/autoload/plug.vim ]; then
    echo $vimdir
    echo "$vimdir/autoload/plug.vim"
    curl -fLo $vimdir/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi

  # set up .vimrc 
  rm $vimconf
  ln -s $(pwd)/.dotfiles/.vimrc $vimconf

  # set up plugins.vim for ~/.vimr/plugins.vim
  rm $vimdir/plugins.vim
  ln -s $(pwd)/vimstuff/plugins.vim $vimdir/plugins.vim

  # set up the ~/.vim/ftplugin folder
  rm -rf $vimdir/ftplugin
  mkdir -p $vimdir/ftplugin
  #   create a symlink for each of the .vim files in ftplugin
  for file in $(pwd)/vimstuff/ftplugin/*; do
    # $file contains the full path to the file
    filename=$(basename $file);
    echo "creating symlink ~/.vim/ftplugin/$filename -> $file"
    ln -s $file  $vimdir/ftplugin/$filename;
  done

  # setup additional plugins to vim
  if [ -d $vimdir/extra-plugins ]
  then
    rm -rf $vimdir/extra-plugins
  fi

  mkdir -p $vimdir/extra-plugins
  for file in $(pwd)/vimstuff/extra-plugins/*; do
    filename=$(basename $file);
    echo "creating symlink ~/.vim/extra-plugins'$filename -> $file"
    ln -s $file $vimdir/extra-plugins/$filename
  done
  echo ""
fi

echo ""
echo "***** Setting up nvim *****"
#### setup nvim
if [ $1 = 'nvim' ]; then
  if [ ! -e ~/.config/nvim ]; then
    echo "~/.config/nvim not found"
    mkdir -p $HOME/.config/nvim
  fi

  if [ ! -e ~/.local/share/nvim ]; then
    echo "~/.local/share/nvim not found"
    mkdir -p $vimdir
  fi

  # setup vimplug
  if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "$vimdir/site/autoload/plug.vim"
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi

  # setup init.vim
  rm $vimconf
  ln -s $(pwd)/.dotfiles/init.vim $vimconf

  # set up plugins.vim for ~/.local/share/nvim/site/
  rm $vimdir/plugins.vim
  ln -s $(pwd)/nvimstuff/plugins.vim $vimdir/site/plugins.vim

  # set up the ~/.vim/ftplugin folder
  rm -rf $vimdir/ftplugin
  mkdir -p $vimdir/ftplugin
  #   create a symlink for each of the .vim files in ftplugin
  for file in $(pwd)/nvimstuff/ftplugin/*; do
    # $file contains the full path to the file
    filename=$(basename $file);
    echo "creating symlink ~/.local/share/nvim/ftplugin/$filename -> $file"
    ln -s $file  $vimdir/ftplugin/$filename;
  done

  # setup additional plugins to nvim
  if [ -d $vimdir/extra-plugins ]
  then
    rm -rf $vimdir/extra-plugins
  fi

  mkdir -p $vimdir/extra-plugins
  for file in $(pwd)/nvimstuff/extra-plugins/*; do
    filename=$(basename $file);
    echo "creating symlink ~/.local/share/nvim/extra-plugins'$filename -> $file"
    ln -s $file $vimdir/extra-plugins/$filename
  done
  echo ""
fi
# zsh plug-ins

#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

