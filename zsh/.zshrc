# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# source ~/.powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Lines were added by zsh-newuser
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=3000

unsetopt beep

zstyle :compinstall filename '/home/cookie/.zshrc'
autoload -Uz compinit
compinit

# # GPG key
# if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
#     source ~/.gnupg/.gpg-agent-info
#     export GPG_AGENT_INFO
# else
#     eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
# fi

# Custom alias
alias cpr="cp -R"	# Copy recursively, including hidden files
alias rmr="rm -rf"	# Delete recursively, including hidden files
alias ls="ls --color"
alias gdb="arm-none-eabi-gdb" # While working with microbit on Arch

alias v="nvim"
alias n="nvim"
alias shutdown="shutdown now"
alias off="systemctl poweroff"
alias sleep="systemctl suspend"
alias bake="systemctl suspend"

alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
# alias lt='lsd --tree'
alias lt='_lt() {
    lsd --tree --depth "$1"
};  _lt'

# Terminal CTRL+Left/Right Arrow Keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export EDITOR=nvim
# export PATH=$PATH:/home/cookie/.spicetify
source $HOME/.cargo/env

eval "$(zoxide init zsh)"
