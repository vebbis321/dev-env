export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-tab)

# vi mode
VI_MODE_SET_CURSOR=false

source $ZSH/oh-my-zsh.sh

#alias
alias nv='nvim'
alias p='python3'

# fzf 
source /usr/share/fzf/shell/key-bindings.zsh
source $HOME/.zsh_profile

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# funcions / key key-bindings
bindkey -s '^f' 'tmux-sessionizer^M'

# nvim
export EDITOR="/usr/bin/nvim"

# man
export MANPAGER='nvim +Man!'
