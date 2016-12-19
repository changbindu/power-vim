#!/bin/bash

update=false

if [ -f ~/.vim/tips.md ] && [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Seems you have already installed me, update or reinstall?"
    select ur in "update" "reinstall"; do
        case $ur in
            update ) update=true; break;;
            reinstall ) break;;
        esac
    done
fi

if [ $update == false ]; then
    echo -e "\033[31mDo you wish to remove old ~/.vim files?\033[0m"
    select yn in "Yes" "No"; do
        case $yn in
            Yes )
                 echo "remove ~/.vim folder..." 
                 rm ~/.vim -rf && mkdir -p ~/.vim
                 break;;
            No )
                 echo "terminated"
                 exit;;
        esac
    done
fi

echo "Installation will take some time, please wait!"
cp vimrc ~/.vimrc
cp tips.md ~/.vim/

sudo apt-get install python-pip vim vim-nox exuberant-ctags cscope git astyle
sudo pip install dbgp vim-debug pep8 flake8 pyflakes isort

echo "now installing plugins, please ignore the error of missing color scheme 'fisa'"

if [ $update == false ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

    echo "Installing plugins"
    vim +PluginInstall +qall
else
    echo "Update plugins"
    vim +PluginUpdate
fi

echo "All done, enjoy with pow-vim!"

