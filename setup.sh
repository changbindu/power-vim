#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"

echo -n "remove old .vim files?[PRESS ENTER TO CONTINUE]:"
read confirm
if [ -n "$confirm" ]; then
	echo "terminated"
	exit 1
fi

rm ~/.vim -rf
cp ./ ~/.vim/ -rf
mv ~/.vim/.vimrc ~/ -f

sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools
sudo easy_install -ZU autopep8 twisted
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags

git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "正在努力为您安装bundle程序" > tmp.log
echo "安装完毕将自动退出" >> tmp.log
echo "请耐心等待" >> tmp.log
vi tmp.log -c "BundleInstall" -c "q" -c "q"
rm tmp.og
echo "安装完成"

