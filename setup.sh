#!/bin/bash
echo "Installation will take some time, please wait!"

echo -n "Will remove old ~/.vim files[PRESS ENTER TO CONTINUE]:"
read confirm
if [ -n "$confirm" ]; then
	echo "terminated"
	exit 1
fi

rm ~/.vim -rf && mkdir -p ~/.vim
cp .vimrc ~/.vimrc
cp tips.md ~/.vim/

sudo apt-get install python-pip vim exuberant-ctags git astyle
sudo pip install dbgp vim-debug pep8 flake8 pyflakes isort

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing plugins"
vim +PluginInstall +qall
echo "All done, enjoy with pow-vim!"

