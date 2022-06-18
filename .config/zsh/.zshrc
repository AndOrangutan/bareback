
export PATH=$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$PATH

###########
# Aliases #
###########
source $ZDOTDIR/aliases

########################
# Set color and prompt #
########################
autoload -U colors && colors

###########
# History #
###########
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

############################
# Set Keyboard Repeat Rate #
############################

###########################
# Basic auto/tab complete #
###########################
autoload -Uz compinit promptinit
compinit
promptinit
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zmodload zsh/complist
_comp_options+=(globdots)

#################
# Sane defaults #
#################
setopt autocd
setopt COMPLETE_ALIASES
unsetopt beep

###########
# vi mode #
###########
bindkey -v
export KEYTIMEOUT=1

##################
# History search #
##################
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-s

##################
# bareback setup #
##################
alias bareback='/usr/bin/git --git-dir=$HOME/.bareback --work-tree=$HOME'

################################
# Edit line in vim with ctrl+e #
################################
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

#################################
# Add vim-keys to control menue #
#################################
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

############################################
# Change cursor shape depending on vi mode #
############################################
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]];
        then echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]
        then echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'

##################
# Starship setup #
##################
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL='>'
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=true
SPACESHIP_USER_SHOW=true
SPACESHIP_DIR_SHOW=always
SPACESHIP_DIR_TRUNC=1

###########
# Plugins #
###########
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

prompt spaceship
