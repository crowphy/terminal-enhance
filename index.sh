#! /bin/bash
###
 # @Author: crowphy
 # @Date: 2021-04-26 18:42:25
 # @LastEditTime: 2021-04-27 11:49:53
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


cmdrcpath="$(pwd)/$(dirname $0)/.cmdrc"

cmdrcexist="$(cat ~/.zshrc | grep ${cmdrcpath})"

if [[ $cmdrcexist ]]
then
    echo .cmdrc path exist
else
    echo "source ${cmdrcpath}" >> ~/.zshrc
fi

echo done
