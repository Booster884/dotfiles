if [[ -n "$IN_NIX_SHELL" ]]; then
	nixlabel='%F{cyan}*%f '
fi

source ~/zsh-nix-shell/nix-shell.plugin.zsh

autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
export PROMPT='%1~ %F{blue}${vcs_info_msg_0_}%f$nixlabel%(?.%F{green}.%F{red})>%f '
# unset nixlabel

# https://salferrarello.com/zsh-git-status-prompt/
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# Blessed zsh completion
autoload -U compinit && compinit

export TERMINAL="alacritty"
export BROWSER="firefox"
export EDITOR="nvim"

alias dotfiles="git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME"
alias lazydots="lazygit --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME"

alias py="python3"
alias pdb="py -m pdb"
alias pypy="pypy3"
alias vim="nvim"

alias du="du -sh"
alias ls="exa --group-directories-first"

# Makes ssh play nice with alacritty
export TERM="xterm-256color"

export HISTFILE=/dev/null

# powerprofilesctl set power-saver
