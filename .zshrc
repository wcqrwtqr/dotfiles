# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mohammedalbatati/.oh-my-zsh"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set name of the theme to load --- if set to "random", it will

# setopt notify

# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# ZSH_THEME="gruvbox"
# SOLARIZED_THEME="dark"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

export DEFAULT_USER="$(whoami)"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"


# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Set fzf installation directory path
export FZF_BASE=/path/to/fzf/install/dir

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    rsync
    zsh-interactive-cd
    fzf
    docker
    python
    macos
    brew
    cp
    zsh-autosuggestions
    # zsh-autocomplete #// Did not like what I though it will be
    z
    iterm2
    pip
    colored-man-pages
    copypath
    copyfile
)

source $ZSH/oh-my-zsh.sh
export PYTHON_UTILS="$HOME/code/python/utils"
export PATH="$PYTHON_UTILS:$PATH"
export PATH=$PATH:

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export FZF_BASE=/path/to/fzf/install/dir
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# alias tmux="TERM=screen-256color-bce tmux"
alias ls="exa"
alias myip="curl http://ipecho.net/plain; echo"
alias mylocalip="ifconfig | grep en0 -A 2 | grep 192"
alias usage="du -h -dl"
alias myrouter="ipconfig getoption en0 router"
alias allip="arp -a" # get all the IP for other devices on the network
alias mynet="ipconfig getpacket en0"
alias dpsa="docker ps --all"
alias dps="docker ps"
alias drc="docker rm"
alias dil="docker image list"
alias dri="docker rmi"
alias dsp="docker system prune"
alias dcps="docker-compose ps"
alias dcup="docker-compose up -d"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
alias dci="docker-compose images"
alias vimrc="nvim ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/init.lua"
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias cheat="curl cht.sh"
alias sot="tmux source ~/.tmux.conf"
alias p3="python3"
alias yd="youtube-dl"
alias emacs="open -a emacs"
alias cat="bat"
alias grep="rg"
alias fzft="fzf-tmux -r 35%"
alias docker_mpfmsite="docker run -p 8501:8501 mpfm:latest"
alias dcup_mpfm="(cd ~/Anaconda\ Projects/Others/streamlit/MPFM-Upload-Streamlit ; dcup ; echo 'port 8501')"
alias dcd_mpfm="(cd ~/Anaconda\ Projects/Others/streamlit/MPFM-Upload-Streamlit ; dcd)"
alias docker_datasite="docker run -p 8888:8501 datasite:latest"
alias docker_pivotsite="docker run -p 8080:8501 pivot:latest"
alias dcup_equip="(cd ~/Anaconda\ Projects/NewCarrier/docker_equipment_site_django_2022 ; dcup ; echo 'port 8000 for site and port 5050 for pgadmin')"
alias dcd_equip="(cd ~/Anaconda\ Projects/NewCarrier/docker_equipment_site_django_2022 ; dcd)"
alias la="ls -al"

# Make a quick github comit and push to github with small letters
function acp(){
    git add -A
    git commit -m "$1"
    git push
}

#Below function used to go fuzzy find directory and cd to it 
function fcd(){
    cd "$(find . -type d | fzf)"
}


# Key binding for using vim while selecting the autocompelte
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# configure key keybindings
 bindkey '^L' forward-word          # ctl + l             # moves pointer forward a word
 bindkey '^H' backward-word         # ctl + h             # moves pointer backward a word
 # bindkey '^[[3~'   kill-whole-line       # delete                # deletes whole line
 # bindkey '^[[1;5A' undo                  # ctrl + arrow up       # undo
 # bindkey '^x'	     edit-command-line	    # ctrl + x              # edit line in Vi
 # bindkey '^x^e'	   edit-command-line	    # ctrl + x + e          # same but more common keybind
 # bindkey '^P'      toggle_prompt         # ctrl + p              # change prompt mode



source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mohammedalbatati/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mohammedalbatati/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mohammedalbatati/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mohammedalbatati/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/sbin:$PATH"

#below code was added to fix the streamlit libirary for python as adviced in the web site
#https://discuss.streamlit.io/t/command-not-found/741/6
export PATH="$HOME/.local/bin:$PATH"

export PATH="/Users/mohammedalbatati/Library/Python/3.9/bin:$PATH"
# go path
# export PATH="$HOME/$(go env GOPATH)/bin:$PATH"
# export PATH="$HOME/$(go env GOPATH):$PATH"
# export PATH="$HOME/go/bin:$PATH"

# export GOROOT=/usr/local/go
# export GOPATH=~/Development/gocode
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin



# Below is the code to add vim to the terminal if you are tired then remove it
# bindkey -v

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# neofetch
pfetch
iStats cpu
cpu.sh
