export ZSH="/Users/themadeknight/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  z git rails history zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export LANG=en_US.UTF-8

# Homebrew's sbin
export PATH="/usr/local/sbin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# vscode
export EDITOR='code'

# Go Version Manager
[[ -s "/Users/miaoqingxin/.gvm/scripts/gvm" ]] && source "/Users/miaoqingxin/.gvm/scripts/gvm"

# Node version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 开启代理
function proxy_off(){
    unset http_proxy
    unset https_proxy
    unset all_proxy
    echo -e "已关闭代理"
}
# 关闭代理
function proxy_on() {
  export https_proxy=http://127.0.0.1:7890
  export http_proxy=http://127.0.0.1:7890
  export all_proxy=socks5h://127.0.0.1:7891
  echo -e "已开启代理"
}

[[ -s "/Users/themadeknight/.gvm/scripts/gvm" ]] && source "/Users/themadeknight/.gvm/scripts/gvm"
