#! /bin/bash
###
 # @Author: crowphy
 # @Date: 2021-04-26 18:42:25
 # @LastEditTime: 2021-05-13 10:43:06
 # @LastEditors: crowphywu
 # @Description: In User Settings Edit
 # @FilePath: /beautify-terminal/index.sh
### 

ohmyzshconf="$(ls -a ~ | grep '\.oh-my-zsh')"

if [[ $ohmyzshconf == "" ]]
then
    # 官方的远程脚本会退出shell导致后续流程中断，小改一下
    sh -c "$(curl -fsSL https://raw.github.com/crowphy/terminal-enhance/master/install-ohmyzsh.sh)"
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

exec zsh -l
