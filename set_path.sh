#!/bin/bash

#### this script exports environmental variables to .bashrc and .zshrc

#### .bashrc
touch ~/.bashrc && echo "export PATH=\$PATH:$PWD/mybin" | tee -a  ~/.bashrc

#### .zshrc
touch ~/.zshrc && echo "export PATH=\$PATH:$PWD/mybin" | tee -a ~/.zshrc
