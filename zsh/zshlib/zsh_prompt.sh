
#--------------------------------------------------------
#zsh 的prompt 主题修改
#---------------------

prompt fire  #貌似必须先选一个 ,才能自定义,不知道是什么bug
  #autoload -U promptinit && promptinit
autoload -U colors && colors  #加载颜色模块


#-------------- 如果要在prompt中演算其他函数,就需要setopt RPOMPT_SUBST,类似即时eval
setopt PROMPT_SUBST

    #---------------------------------------------------
    #neo4j版本切换:
    #
    #通过gsub环境变量
    neo18=/home/john/neo4j/neo4j-community-1.8.2/bin
    neo20=/home/john/neo4j/neo4j-community-2.0.0-M02/bin
    PATH=$PATH:$neo18
    neostat1='neoversion=neo-2.0;lastneo=$neo18;nextneo=$neo20;neostat0=$neostat2'
    neostat2='neoversion=neo-1.8;lastneo=$neo20;nextneo=$neo18;neostat0=$neostat1'
    neostat0=$neostat2

    neoxt(){
      eval $neostat0
      PATH=`_neoxt`
    }

    _neoxt(){
      #ruby -e "print '${PATH}'.gsub('${lastneo}', '${nextneo}')"
    }

    #  eval $neostat0
    #  ruby -e "exec %Q{PATH=#{'${PATH}'.gsub('${lastneo}', '${nextneo}')} }"
    #---------------------------------------------------



#|    #---------------------------------------------------
#|    #ls提示符状态机: 
#|    stat1='prompt_method_ls="ls --file-type |column -c 150";stat0=${stat2};'
#|    stat2='prompt_method_ls="echo method:prompt_ls";        stat0=${stat1};'
#|    prompt_ls(){
#|      eval ${stat0}
#|    }
#|    #状态机init
#|    stat0=${stat2}
#|    prompt_ls
#|
#|
#|    #另一个状态机thor_installed
#|    t_stat1='t_stat0=${t_stat2};prompt_method_thor_installed="thor installed"'
#|    t_stat2='t_stat0=${t_stat1};prompt_method_thor_installed="echo method:prompt_thor"'
#|    prompt_thor(){
#|      eval ${t_stat0}
#|    }
#|    #状态机init
#|    t_stat0=${t_stat2}
#|    prompt_thor
#|
#|    #---------------------------------------------------



#-------要实现"多行prompt"也可以借助调用 echo `命令`群   <---!!!!!!好用
pt_path="%B%{$fg[red]%}%~%{$reset_color%}%b"
#pt_time="%B%{$bg[red]$fg[cyan]%}   %T   %{$reset_color%}%b"
pt_time="%B%{$bg[red]$fg[cyan]%} `ruby -e "puts Time.now.strftime('%Y-%m-%d, %H:%M')"` %{$reset_color%}%b"
pt_user="------%B%{$fg[blue]%}%n%{$reset_color%}%b"
pt_return="[%{$fg[yellow]%}%?%{$reset_color%}]"
pt_line=${pt_return}
pt_tail="%{$bg[green]%}   %{$reset_color%} "



prompt_functions(){
  echo "%{$fg[black]$bg[yellow]%}[nvm:node-`node -v`]%{$reset_color%}\
%{$fg[black]$bg[red]%}[rvm:`rvm current`]%{$reset_color%}\
%{$fg[black]$bg[yellow]%}[java6/7:${JAVA_HOME}]%{$reset_color%}\
%{$fg[black]$bg[red]%}[neoxt:$neoversion]%{$reset_color%}\
%{$fg[black]$bg[yellow]%}[mvm:mongo-version]%{$reset_color%}\n\
%{$fg[black]$bg[yellow]%} apropos appname%{$reset_color%}\
%{$fg[black]$bg[green]%}ls权限排列owner-group-others:[0~7][0~7][0~7]:rwx-rwx-rwx%{$reset_color%}\
%{$fg[black]$bg[blue]%}(gitolite)ssh git@localhost 'desc name_without_dot_git description'%{$reset_color%}\n\
%{$fg[black]$bg[blue]%}\
chown|chgrp|chmod(-R)|useradd user|userdel user|passwd user|gpasswd -a user group|gpasswd -d user group\
%{$reset_color%}\
%{$fg[black]$bg[green]%}\
|改完组后记得要logout再login才会生效\
%{$reset_color%}\n\
%{$fg[black]$bg[green]%}\
groups group_name命令经常出差错,不如用cat /etc/groups|grep group_name\
%{$reset_color%}\
%{$fg[black]$bg[yellow]%}\
查看安装时间 ls /var/lib/dpkg/info|grep package_name\
%{$reset_color%}\n\
%{$fg[black]$bg[blue]%}\
查正向依赖:apt-cache depends pacakgename 查反向依赖:apt-cache rdepends packagename\
%{$reset_color%}\
%{$fg[black]$bg[red]%}\
rake -T 列出当前rakefile所有desc内容\
%{$reset_color%}\n\
%{$fg[black]$bg[cyan]%}\
"r 只可用读方法,不能新增文件 \*默认\*"\
%{$reset_color%}\
%{$fg[black]$bg[green]%}\
"r\+可读可用覆盖方法,不能新增文件"\
%{$reset_color%}\
%{$fg[black]$bg[cyan]%}\
"w 只可用覆盖方法"\
%{$reset_color%}\
%{$fg[black]$bg[red]%}\
"thor install的script和其origin地址都在~/.thor目录中"\
%{$reset_color%}\n\
%{$fg[black]$bg[green]%}\
"w\+只可用覆盖和读方法"\
%{$reset_color%}\
%{$fg[black]$bg[blue]%}\
"a 只追加,写方法行为变为追加行为"\
%{$reset_color%}\
%{$fg[black]$bg[green]%}\
"a\+可读可追加,写方法行为变为追加行为"\
%{$reset_color%}\
%{$fg[black]$bg[cyan]%}\
"注:未见:--可追加,可读,但不能新增文件的"\
%{$reset_color%}\
%{$fg[black]$bg[green]%}\
"last 最后n次登录"\
%{$reset_color%}"   #强烈: 注意 \n 回车,如果不想颜色串行,\n应该放在 %{reset_color%}之后


  ttips -s #|head -n 2 #访问本地ruby写的tips 的web服务
#echo "常规%{$fg[black]$bg[yellow]%}[添加所有变动:git add . ]%{$reset_color%}\

  if test -e 'env'
  then
    echo "     \
%{$fg[yellow]%}env%{$reset_color%}\
%{$fg[green]%}:`cat ./env`%{$reset_color%}"
  fi
  if test -e '.JunProject.json'
#打印项目文件:
  then
    echo "     \
%{$fg[yellow]%}env%{$reset_color%}\
%{$fg[green]%}:`cat  .JunProject.json`%{$reset_color%}"
  fi


#|  #ls启动提示符:
#|  eval $prompt_method_ls
#|  eval $prompt_method_thor_installed
}

prompt_call_function(){
  pt_line=${pt_line}'$(prompt_functions)'
}




pt_head(){
 echo " \n \n \n"
}
git_origin(){
  echo " "
  if [ -d .git ]; then
    echo "< 当前git目录的remote配置: `git config --get remote.origin.url`  >"
    echo " ";
  else
    echo " "
  fi;
}
irb_tricks(){
  echo "irb中再调用:irb(start a new subsession);jobs (list subsessions);fg(switch to a subsession)kill(kill a subsession)vim(open vim)"
}
git_remote_branch(){
#  if [ -d .git ]; then
#    echo "<`git branch -r`  >"
#  else
#    echo "<  >";
#  fi;
#echo " "
}

git_branch(){
  if [ -d .git ]; then
    echo "\n`git branch`\n"
  else
    echo "[没有.git目录]"
  fi
}

rvm_usage(){
echo "\n\
使用gemset例子: rvm use 1.8.7 ---> rvm gemset create sunjun---> rvm use 1.8.7@sunjun\
--->rvm gemset copy 1.8.7@test 1.8.7@sunjun\n\
%{$fg[black]$bg[red]%}\
'rvm list #显示所有已安装平台'\
%{$reset_color%} \
%{$fg[black]$bg[red]%}\
'rvm current #列出当前平台'\
%{$reset_color%} \
%{$fg[black]$bg[red]%}\
'rvm gemset list #列出当前平台各个库环境'\
%{$reset_color%} \
%{$fg[black]$bg[red]%}\
'rvm use 平台@库换境 #切换不同平台和环境'\
%{$reset_color%}"
}
bundle_usage(){
echo "\n\
有的人一年多没用自已创建的 gemset 了:\n\
一律 bundle install --binstubs --path vendor 将 project 依赖和可执行文件独立在开发目录下\n\
好用的命令帮助: http://bundler.io/v1.5/commands.html"
}
last_enter(){
  echo ' '
  echo ' '
}



PROMPT='$(pt_head)'${pt_return}${pt_user}${pt_time}'$(prompt_functions)'\
'$(git_remote_branch)$(irb_tricks)'\
'$(rvm_usage)'\
'$(bundle_usage)'\
'$(last_enter)'\
'$(git_origin)'\
'$(git_branch)'\
${pt_path}${pt_tail}
#可以用PS1='xxx'代替PROMPT,terminal也能识别
#

#---------------------------------------------------------------------------------------------
#其他可用的prompt 宏.

  #编程模型提示符:
##echo "接口最少简化\
##%{$fg[yellow]%}(client_event_and_data_and_ui_stat)%{$reset_color%}(改动驱动)\
##%{$fg[blue]%}(observer)%{$reset_color%}(数据->状态机桥梁)\
##%{$fg[yellow]%}(visual_stat_factory)%{$reset_color%}(渲染)\
##%{$fg[blue]%}(synchronize)%{$reset_color%}(同步通信接口)\
##%{$fg[yellow]%}(safe)%{$reset_color%}(安全状态机接口)\
##%{$fg[blue]%}(server_data)%{$reset_color%} "
#


#打印当前关注的项目
#    echo "     \
#%{$fg[black]$bg[yellow]%}CURRENT PROJECT%{$reset_color%}\
#%{$fg[black]$bg[blue]%}:[`cat ~/.JunProject_current`]%{$reset_color%}"
#    echo "     \
#%{$fg[black]$bg[yellow]%}CARING ENV%{$reset_color%}\
#%{$fg[black]$bg[blue]%}:[`cat ~/.JunCaring`]%{$reset_color%}"
#打印小技巧:
#  if test -e 'tips'
#  then
#    echo "     \
#%{$fg[yellow]%}tips%{$reset_color%}\
#%{$fg[green]%}:`cat ./tips`%{$reset_color%}"
#  fi
#打印环境变量:




#---------------------------------------------------------------------------------------------
#帮助:
#$fg[color]    #will set the textcolor(red,green,blue, etc)
#$bg[color]    #will set the background color(red,green,blue, etc)
#$reset_color  #will reset the textcolor to white  #It is useful to put these commands in %{ [...] %}.

#<<Possible color values>>
    #black
    #red
    #green
    #yellow
    #blue
    #magenta
    #cyan
    #white


##http://www.commandlinefu.com/commands/view/5876/show-numerical-values-for-each-of-the-256-colors-in-zsh



#显示可用主题:
#$ prompt -l
#Currently available prompt themes:
#adam1 adam2 bart bigfade clint elite2 elite fade fire off oliver pws redhat suse walters zefram

#切换主题:
#$prompt fire  #切换为火主题


#
##http://www.commandlinefu.com/commands/view/5876/show-numerical-values-for-each-of-the-256-colors-in-zsh
#
#

