#!/bin/sh
mkdir -p ~/.tmuxinator
for file in ./tmuxinator/*
do
  if [ -f $file ]
  then
    ln -t ~/.tmuxinator/ $file
  fi
done
#---------------------------------------------------------
#emacs和vim 自动补全的插件 更新


#---------------------------------------------------------
#nodejs
#npm镜像:
#去下载nodejs  #然后configure => make => sudo make install => done
[ `which node` = /usr/local/bin/node ] || echo "还未安装nodejs"
[ `which npm` =  /usr/local/bin/npm ]  || npm config set registry http://registry.cnpmjs.org npm info underscore

#---------------------------------------------------------
mkdir -p ~/bin
ln ./git/git-meld.sh ~/bin/git-meld.sh

#---------------------------------------------------------
#单个文件的link,前一个是源, 后一个是目标
#for bash
ln  ./inputrc  ~/.inputrc


#带-t后 ,后一个是源, 前一个是目标
#for zshlib
mkdir -p ~/.zshlib
for file in ./zsh/zshlib/*
do
  if [ -f $file ]
  then
    ln -t ~/.zshlib/  $file
  fi
done
ln  ./zsh/zshrc   ~/.zshrc

#---------------------------------------------------------
ln  ./vim/vimrc  ~/.vimrc


#---------------------------------------------------------
ln  ./emacs/emacs  ~/.emacs

#将./emacs/emacs_lib 中的文件 移动到~/.emacs.d/emacs_lib/中
mkdir -p ~/.emacs.d
mkdir -p ~/.emacs.d/emacs_lib

for file in ./emacs/emacs_lib/*
do
  if [ -f $file ]
  then
    ln -t ~/.emacs.d/emacs_lib/ $file
  fi
done

#------------------------------------------------------------------------------------------------------------------
#ubuntu 14.04 wifi不稳定的解决方案:


#(((Temporary solution)))
#
#For a temporary solution, e.g. to check if the proposed solution helps for your setup,
#reload the iwlwifi kernel module with option 11n_disable set to 1, in order to disable 802.11N, e.g. by
#
#sudo sh -c 'modprobe -r iwlwifi && modprobe iwlwifi 11n_disable=1'
#You will be asked for your sudo password as you need root privilegues to reload a kernel module.
#
#
#(((Permanent solution)))
#
#For permanently disabling 802.11N in the driver, add the line
#
#       options iwlwifi 11n_disable=1
#to
#
#       /etc/modprobe.d/iwlwifi.conf
#
#or issue the following bash command, that does the above automatically. You will be asked for your sudo password as we are modifying a system file.
#
#sudo sh -c 'echo "options iwlwifi 11n_disable=1" >> /etc/modprobe.d/iwlwifi.conf'

#------------------------------------------------------------------------------------------------------------------



