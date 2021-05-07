# 终端命令组合与美化
一键安装常用的终端插件，组合常用的命令，让你少敲几下键盘
## 效果(简写、提示、高亮)
![](./example.png)
## 使用说明:
1. `sh -c "$(curl -fsSL https://raw.github.com/crowphy/terminal-enhance/master/index.sh)"`
2. `source ~/.zshrc`
>该脚本会在home目录下添加两个配置文件`.commoncmdrc`和`.privatecmdrc`，`.commoncmdrc`中的配置与[远程仓库](https://github.com/crowphy/terminal-enhance/blob/master/index.sh)保持一致，若要更新，再次执行上述命令即可；`.privatecmdrc`为空文件，不会被更新，可以添加自己定义的一些快捷命令等。
## 插件
1. 命令提示: `zsh-autosuggestions`
2. 语法高亮: `zsh-syntax-highlighting`
## 别名(目前都是git相关的命令别名)
```shell
# add(务必保证插件顺序，zsh-syntax-highlighting必须在最后一个)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## git相关
alias gn="git clone"

alias ga="git add"
alias gc="git checkout"
alias gr="git rebase"
alias gf="git fetch"

alias gaa="git add ."
alias gst="git status"
alias gct="git checkout"
alias gcb="git checkout -b"
alias gcm="git add . && git commit -m"
# 删除分支
alias gbd="gc master && git branch -D"

# 查看git提交记录
alias gg="git log"
alias ggo="git log --oneline"

# 查看远程仓库的地址
alias gmv="git remote -v"
# 设置或移出远程仓库的地址
alias gmao="git remote add origin"
alias gmro="git remote remove origin"
alias gmau="git remote add upstream"
alias gmru="git remote remove upstream"

# 拉取远程(origin)分支到本地
gcbo () {
    git checkout -b $1 origin/$1
}
# 拉取远程(upstream)分支到本地
gcbu () {
    git checkout -b $1 upstream/$1
}

# 拉取当前分支
alias gl="git pull"
# 拉取当前分支并从master分支rebase
alias glm="git pull --rebase origin master"

# 推送到当前分支
alias gp='echo 当前分支： $(git branch --show-current) && git push --force --set-upstream origin $(git branch --show-current)'
#先从master分支rebase再推送到当前分支
gpr () { 
    cd $(git rev-parse --show-toplevel) && git add . && git commit -m "$1" && git pull --rebase origin master && gp
}

# 解决冲突
alias grc="git add . && git rebase --continue"
alias grs="git add . && git rebase --skip"
alias gra="git add . && git rebase --abort"

```

## 其他
如果有其他共享的可以直接提mr合入或者提issue