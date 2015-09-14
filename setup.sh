#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"

echo -n "Will remove old ~/.vim files[PRESS ENTER TO CONTINUE]:"
read confirm
if [ -n "$confirm" ]; then
	echo "terminated"
	exit 1
fi

rm ~/.vim -rf
cp .vimrc ~/.vimrc

sudo apt-get install vim exuberant-ctags git
sudo pip install dbgp vim-debug pep8 flake8 pyflakes isort

echo "正在安装Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "正在安装所有插件，请耐心等待"
vim +PluginInstall +qall
echo "安装完成"

