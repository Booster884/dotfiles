export PROMPT="%1~ %(?.%F{2}.%F{1})>%f "

# Blessed zsh completion
autoload -U compinit && compinit

export PATH="/home/$USER/.emacs.d/bin:$PATH"

export TERMINAL="alacritty"
export BROWSER="firefox"
export EDITOR="nvim"

alias dotfiles="git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME"

alias py="python"
alias vim="nvim"

alias ls="exa --group-directories-first"

# Makes ssh play nice with alacritty
export TERM="xterm-256color"

export HISTFILE=/dev/null

powerprofilesctl set power-saver
