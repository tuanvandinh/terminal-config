#!/bin/bash

## prerequisite
sudo apt-get update
sudo apt-get install git
git config --global user.email ""
git config --global user.name ""

#mkdir ~/git && cd ~/git

## zsh agnoster
sudo apt-get install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo "zsh" >> ~/.bashrc
sudo apt-get install fonts-powerline -y
#cp ~/git/workspace/terminal-config/zsh-theme/agnoster2.zsh-theme ~/.oh-my-zsh/themes/
rm ~/.zshrc
touch ~/.zshrc && echo "source ~/git/terminal-config/zsh/zshrc" >> ~/.zshrc
rm ~/.zshenv
touch ~/.zshenv && echo "source ~/git/terminal-config/zsh/zshenv" >> ~/.zshenv

# neovim
#sudo add-apt-repository ppa:neovim-ppa/unstable
#sudo apt-get update
sudo apt-get install neovim -y
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim && echo "source ~/git/terminal-config/vim/init.vim" >> ~/.config/nvim/init.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

## tmux
sudo apt-get install tmux -y
touch ~/.tmux.conf && echo "source ~/git/workspace/terminal-config/tmux/tmux.conf" >> ~/.tmux.conf

## python
sudo apt-get install python-pip -y
sudo apt-get install python3-pip -y
sudo apt-get install virtualenv -y

## nodejs
sudo apt-get install nodejs -y
