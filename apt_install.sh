#!/bin/sh
[ -s "/usr/bin/zsh" ] ||sudo apt-get install zsh
[ -s "/usr/bin/zsh" ] && echo "zsh installed" || echo "zsh install failed"

[ -s "/usr/bin/vim" ] ||sudo apt-get install vim-rails
[ -s "/usr/bin/vim" ] && echo "vim-rails installed" || echo "vim-rails install failed"

[ -s "/usr/bin/emacs" ] ||sudo apt-get install emacs24-lucid
[ -s "/usr/bin/emacs" ] && echo "emacs24-lucid installed" || echo "emacs24-lucid install failed"

#ubuntu上的dash
[ -s "/usr/bin/zeal" ] || sudo add-apt-repository ppa:zeal-developers/ppa
[ -s "/usr/bin/zeal" ] || sudo apt-get update
[ -s "/usr/bin/zeal" ] || sudo apt-get install zeal
[ -s "/usr/bin/zeal" ] && echo "zeal installed" || echo "zeal install failed"


#docker源更新
#
#docker设置daocloud镜像
#
#下载常用的镜像


#163源更新



#数据库更新
#sqlite      #用来出demo不错
[ -s "/usr/bin/sqlite" ] || sudo apt-get install sqlite #sqlite - command line interface for SQLite
[ -s "/usr/bin/sqlite" ] && echo "sqlite installed" || echo "sqlite install failed"

#mongodb
[ -s "/usr/bin/mongo" ] || sudo apt-get install mongodb
[ -s "/usr/bin/mongo" ] && echo "mongodb installed" || echo "mongodb install failed"

#redis
[ -s "/usr/bin/redis-server" ] || sudo apt-get install redis-server
[ -s "/usr/bin/redis-server" ] && echo "redis-server installed" || echo "redis-server install failed"

##mariadb
mariadb_server=`which mariadb-server`
[ -s '/usr/bin/mariadb-server' ] || sudo apt-get install mariadb-server
[ -s '/usr/bin/mariadb-server' ] && echo "mariadb-server installed" || echo "mariadb-server install failed"


#redis

#rbenv
echo 'readme'
ehco 'http://segmentfault.com/a/1190000000366488'
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(rbenv init -)"' >> ~/.zshenv


#ruby源更新
#gem源更新            #淘宝源
#删除官方源
gem sources -r https://rubygems.org/
#安装淘宝源
gem sources -a http://ruby.taobao.org

#安装一堆必须的有用且常用的gem :-)
#各种作用的:-)



#nodejs npm源更新
#安装一堆必须的有用且常用的package :-)
echo "registry = https://registry.npm.taobao.org" > ~/.npmrc
#echo "registry=http://registry.cnpmjs.org" > ~/.npmrc




#--------#前台程序包
#bower
#bower一堆命令
#  npm install bower -g
#  bower install jquery
#  bower install d3
#注: bower源本身就在github
#
#
#





#python源更新
#安装一堆必须的有用且常用的package :-)


#git
#git常用命令准备
[ -s '/usr/bin/git' ] || sudo apt-get install git
[ -s '/usr/bin/git' ] && echo "git installed" || echo "git install failed"


#本地仓库安装
#为本地仓库准备一堆命令:-)


#关键是测试把:-)


# test命令主要还是要配合 && || 等来操作效果会比较好

# [ -e 文件是否存在 ]                #exist
# [ -d 目录是否存在 ]                #directory
# [ -f 文件是否存在并是一个"文件" ]  #file
# [ -s 文件是否存在并非空 ]          #size
# [ -r 文件是否存在并可读 ]          #readable
# [ -w 文件是否存在并可写 ]          #writable
# [ -x 文件是否存在并可运行 ]        #executable

# [ $str1 \< $str2]                #字符串长度比较, 记得加\免得被当作 重定向
# [ $str1 \> $str2]                #字符串长度比较, 记得加\免得被当作 重定向
# [ $str1 =  $str2]                #字符串长度相等比较
# [ $str1 !=  $str2]               #字符串长度不相等比较

#　test 整数1 –eq 整数2            #整数相等
#　test 整数1 –ge 整数2            #整数1大于等于整数2
#　test 整数1 –gt 整数2            #整数1大于整数2
#　test 整数1 –le 整数2            #整数1小于等于整数2
#　test 整数1 –lt 整数2            #整数1小于整数2
#　test 整数1 –ne 整数2            #整数1不等于整数2



