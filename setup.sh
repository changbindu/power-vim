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
echo 'source ~/.vim/vimrc' > ~/.vimrc
cp -rf tips.md vimrc plugin_cfg ~/.vim/

function install_pkgs() {
    for t in $*
    do
        dpkg -s $t >/dev/null 2>&1 || sudo apt install $t
    done
}

function install_pypkgs() {
    for t in $*
    do
        pip list | grep $t >/dev/null 2>&1 || sudo pip install $t
    done
}

install_pkgs python-pip vim vim-nox exuberant-ctags cscope git astyle
#install_pkgs build-essential cmake
#install_pkgs python-dev python3-dev libclang cmake
install_pypkgs dbgp vim-debug pep8 flake8 pyflakes isort

sudo cp kcscope-gen /usr/bin/kcscope-gen
sudo cp ucscope-gen /usr/bin/ucscope-gen

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

#echo 'install YouCompleteMe...'
#cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.sh --clang-completer

echo "All done, enjoy with pow-vim!"

