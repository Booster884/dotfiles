export ZSH="/home/booster/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Exports

# Aliases
alias dotfiles="git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME"
