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
alias cfr="cp -R"	# Copy recursively, including hidden files
alias rmr="rm -rf"	# Delete recursively, including hidden files
alias ls="ls --color"

# Terminal CTRL+Left/Right Arrow Keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

source $HOME/.cargo/env
export PATH=$PATH:/home/cookie/.spicetify

export GPG_TTY=$(tty)
