ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-tab)

source $ZSH/.oh-my-zsh.sh
source /usr/share/fzf/shell/key-bindings.zsh

#alias
alias nv='nvim'
alias p='python3'

# funcions / key key-bindings
bindkey -s '^f' 'tmux-sessionizer^M'

