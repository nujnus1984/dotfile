#!/bin/sh
mkdir -p ~/.tmuxinator
for file in ./tmuxinator/*
do
  if [ -f $file ]
  then
    ln -t ~/.tmuxinator/ $file
  fi
done

#单个文件的link,前一个是源, 后一个是目标
ln  ./inputrc  ~/.inputrc
ln  vim/vimrc  ~/.vimrc

