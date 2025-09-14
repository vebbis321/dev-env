# -- PATHS --
export PATH="$HOME/bin:/usr/.local/bin:$PATH"
export PATH="$HOME/zig-linux-x86_64-0.14.0:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export DEV_ENV="$HOME/repos/bash/dev-env"
export BROWSER=brave-browser

# ssh
# Find the first non-.pub private key in ~/.ssh
key=$(find "$HOME/.ssh" -maxdepth 1 -type f -name 'id_*' ! -name '*.pub' | head -n1)

# If a key is found, pass it to keychain
if [[ -n "$key" ]]; then
  eval "$(keychain --eval --quiet "$key")"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -- SETS --
export EDITOR="/usr/bin/nvim"
export MANPAGER='nvim +Man!'

ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-tab)

source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/shell/key-bindings.zsh

#alias
alias nv='nvim'
alias p='python3'

# funcions / key key-bindings
bindkey -s '^f' 'tmux-sessionizer^M'

