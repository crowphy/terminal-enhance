#! /bin/bash
###
 # @Author: crowphy
 # @Date: 2021-04-26 18:42:25
 # @LastEditTime: 2021-04-26 20:21:08
 # @LastEditors: Please set LastEditors
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

alias="$(dirname $0)/alias.txt"

cat $alias >> ~/.zshrc

echo done
