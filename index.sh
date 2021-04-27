#! /bin/bash
###
 # @Author: crowphy
 # @Date: 2021-04-26 18:42:25
 # @LastEditTime: 2021-04-27 13:13:07
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

cd ~/.oh-my-zsh/custom/plugins/

highlighting="$(ls -a | grep zsh-syntax-highlighting)"

if [[ $highlighting == "" ]]
then
    echo shit
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
fi

autosuggestions="$(ls -a | grep zsh-autosuggestions)"
if [[ $autosuggestions == "" ]]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git
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
