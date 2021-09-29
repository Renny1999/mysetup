#!/bin/bash

### installs color schemes for vim ###
mkdir -p ~/.vim/colors 

### solarized dark
git clone https://github.com/altercation/vim-colors-solarized.git 
mv vim-colors-solarized/colors/solarized.vim ~/.vim/colors/ 
rm -rf vim-colors-solarized
