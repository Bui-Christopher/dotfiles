# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=3000

unsetopt BEEP

zstyle :compinstall filename '/home/cookie/.zshrc'
autoload -Uz compinit
compinit

PINENTRY_USER_DATA="USE_CURSES=1"

# Custom alias
## Linux Stuff
alias cpr="cp -R"	# Copy recursively, including hidden files
alias rmr="rm -rf"	# Delete recursively, including hidden files
alias ls="ls --color"

alias v="nvim"
alias n="nvim"

alias shutdown="systemctl poweroff"
alias off="systemctl poweroff"
alias sleep="systemctl suspend"
alias bake="systemctl suspend"

alias dsr='if [ "$(docker ps -aq)" ]; then docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker volume rm $(docker volume ls -q); else echo "No running containers to stop."; fi'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -lA'
alias lt='_lt() {
    lsd --tree --depth "$1"
};  _lt'

alias cm='cargo make'
alias gdb="arm-none-eabi-gdb" # While working with microbit on Arch

export EDITOR=nvim
# export PATH=$PATH:/home/cookie/.spicetify

if [[ -f "$HOME/.cargo/env" ]]; then
    source $HOME/.cargo/env
fi

eval "$(zoxide init zsh)"
