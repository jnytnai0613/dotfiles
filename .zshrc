# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="rkj-repos"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ll='ls -l'

source $ZSH/oh-my-zsh.sh

export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"

# この前に”krew install krew"を実行する
# すると、~/.krew/bin/kubectl-krew が配置される
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/taniaijunya/.local/share/aquaproj-aqua/bin/terraform terraform

# aqua
export AQUA_LOG_COLOR=always
export AQUA_PROGRESS_BAR=true
export AQUA_GLOBAL_CONFIG=${XDG_CONFIG_HOME:-$HOME/.config}/aqua/aqua.yaml
alias aq='aqua'
alias aqcd='cd ${XDG_CONFIG_HOME:-$HOME/.config}/aqua/'
alias aqgi='aqua generate -i -o $AQUA_GLOBAL_CONFIG'
alias aqia='aqua install --all -c $AQUA_GLOBAL_CONFIG'
alias aqli='aqua list --installed --all | sort'
alias aqup='aqua update -c $AQUA_GLOBAL_CONFIG'

# peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# Kubernetes
source <(kubectl completion zsh)
compdef kubecolor=kubectl
compdef k=kubectl
alias k='kubecolor'
alias kc='kubecolor ctx | peco | xargs kubecolor ctx'
alias kn='kubecolor ns | peco | xargs kubecolor ns'

# Task
alias tg='task dg -t ~/src/github.com/jnytnai0613/dotfiles/Taskfile.dist.yml'
alias tl='task ls -t ~/src/github.com/jnytnai0613/dotfiles/Taskfile.dist.yml'
alias tb='task bd -t ~/src/github.com/jnytnai0613/dotfiles/Taskfile.dist.yml'
alias tk='task kd -t ~/src/github.com/jnytnai0613/dotfiles/Taskfile.dist.yml'

function update_kube_context() {
  local cache_file="/tmp/kube_context_cache"
  local ttl=3  # 秒

  if [[ -f "$cache_file" ]] && [[ $(($(date +%s) - $(stat -f "%m" "$cache_file"))) -lt $ttl ]]; then
    source "$cache_file"
  else
    export KUBE_CONTEXT_SHORT=$(kubectl config current-context 2>/dev/null | sed 's|.*/||')
    export KUBE_CURRENT_NS=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
    echo "export KUBE_CONTEXT_SHORT=$KUBE_CONTEXT_SHORT" > "$cache_file"
    echo "export KUBE_CURRENT_NS=$KUBE_CURRENT_NS" >> "$cache_file"
  fi
}
autoload -U add-zsh-hook
add-zsh-hook precmd update_kube_context

eval "$(starship init zsh)"

# brew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# rbenv
eval "$(rbenv init - zsh)"
FPATH=~/.rbenv/completions:"$FPATH"

autoload -U compinit
compinit
