#!/bin/bash

#### this script exports environmental variables to .bashrc and .zshrc

#### .bashrc
if ! grep -Fq "export PATH=\$PATH:$PWD/mybin" ~/.bashrc
then
  touch ~/.bashrc && echo "export PATH=\$PATH:$PWD/mybin" | tee -a  ~/.bashrc
fi


#### .zshrc
if ! grep -Fq "export PATH=\$PATH:$PWD/mybin" ~/.zshrc
then
  touch ~/.zshrc && echo "export PATH=\$PATH:$PWD/mybin" | tee -a ~/.zshrc
fi
