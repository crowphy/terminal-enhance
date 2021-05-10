#! /bin/bash
###
 # @Author: crowphy
 # @Date: 2021-04-26 18:42:25
 # @LastEditTime: 2021-05-10 15:25:51
 # @LastEditors: crowphywu
 # @Description: In User Settings Edit
 # @FilePath: /beautify-terminal/index.sh
### 

ohmyzshconf="$(ls -a ~ | grep .zshrc)"

if [[ $ohmyzshconf == "" ]]
then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else 
    # 先备份
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

# 在home目录下存放.commoncmdrc配置文件
cd ~
curl -fsSL https://raw.github.com/crowphy/terminal-enhance/master/.commoncmdrc > .commoncmdrc

commoncmdrc="$(cat ~/.zshrc | grep 'source ~/.commoncmdrc')"
if [[ $commoncmdrc == "" ]]
then
    echo "source ~/.commoncmdrc" >> ~/.zshrc
fi

privatecmdrc="$(ls -a ~ | grep .privatecmdrc)"
# 创建私有命令配置文件
if [[ $privatecmdrc == "" ]]
then
    touch .privatecmdrc
    echo "source ~/.privatecmdrc" >> ~/.zshrc
fi

echo done
