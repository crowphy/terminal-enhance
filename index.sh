#! /bin/bash
###
 # @Author: crowphy
 # @Date: 2021-04-26 18:42:25
 # @LastEditTime: 2021-04-29 15:30:25
 # @LastEditors: crowphywu
 # @Description: In User Settings Edit
 # @FilePath: /beautify-terminal/index.sh
### 

ohmyzshconf="$(ls -a ~ | grep .zshrc)"

if [[ $ohmyzshconf == "" ]]
then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else 
    cp ~/.zshrc ~/.zshrc_backup
fi

curpath="$(pwd)"

cd ~/.oh-my-zsh/custom/plugins/

highlighting="$(ls -a | grep zsh-syntax-highlighting)"

if [[ $highlighting == "" ]]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
fi

autosuggestions="$(ls -a | grep zsh-autosuggestions)"
if [[ $autosuggestions == "" ]]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git
fi
# 回到命令执行目录
cd $curpath

cmdrcpath="$(pwd)/$(dirname $0)/.cmdrc"

cmdrcexist="$(cat ~/.zshrc | grep ${cmdrcpath})"

if [[ $cmdrcexist ]]
then
    echo .cmdrc path has existed
else
    echo "source ${cmdrcpath}" >> ~/.zshrc
fi
# 自己用的一些特殊组合
selfrcpath="$(pwd)/$(dirname $0)/.selfrc"

if [ -f $selfrcpath ]
then
    echo .selfrc has existed
else
    touch .selfrc
fi

selfrcexist="$(cat ~/.zshrc | grep ${selfrcpath})"

if [[ $selfrcexist ]]
then
    echo ".selfrc path has existed in .zshrc"
else
    echo "source ${selfrcpath}" >> ~/.zshrc
fi

echo done
