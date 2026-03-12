if [[ -n "$IN_NIX_SHELL" ]]; then
    nixlabel='%F{cyan}*%f '
fi

autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
export PROMPT='%1~ %F{blue}${vcs_info_msg_0_}%f$nixlabel%(?.%F{green}.%F{red})>%f '
# export RPROMPT='%m'
# unset nixlabel

# Show cwd and currently running program in title.
_preexec_title() {
  print -Pn "\e]0;%~ — $2\a"
}
add-zsh-hook preexec _preexec_title
# add-zsh-hook precmd _preexec_title

# https://salferrarello.com/zsh-git-status-prompt/
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# Blessed zsh completion
autoload -U compinit && compinit

export PATH="$PATH:/home/booster/.cargo/bin:/home/booster/.local/bin"

export TERMINAL="alacritty"
export BROWSER="firefox"
export EDITOR="nvim"

# Tell electron programs to use wayland
export ELECTRON_OZONE_PLATFORM_HINT="wayland"
# Print time if command takes more than 5 seconds (CPU time)
export REPORTTIME=5

alias dotfiles="git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME"
alias lazydots="lazygit --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias py="python3"
alias pdb="py -m pdb"
alias pypy="pypy3"
alias vim="nvim"
alias emacs="emacs -nw"
alias ns="nix-shell --run zsh"
alias se="sudoedit"
alias fzfe="fzf | xargs $EDITOR"

alias du="du -sh"
alias df="df -h"
alias ls="eza --group-directories-first"
alias diff="delta"
alias make="make -j $(nproc)"

# Makes ssh play nice with alacritty
export TERM="xterm-256color"

export HISTFILE=/dev/null

# powerprofilesctl set power-saver
