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
mkdir -p ~/bin
ln ./git/git-meld.sh ~/bin/git-meld.sh

#---------------------------------------------------------
#单个文件的link,前一个是源, 后一个是目标
#for bash
ln  ./inputrc  ~/.inputrc

#for zshlib
mkdir -p ~/.zshlib
for file in ./zsh/zshlib/*
do
  if [ -f $file ]
  then
    ln -t ~/.zshlib/ $file
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

#---------------------------------------------------------

