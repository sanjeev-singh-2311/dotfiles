# Environment variables
export EDITOR="/usr/bin/nvim"
export PATH="$HOME/bin:$PATH" # Adds the ~/bin to PATH
export TERM="xterm-256color"
export LC_ALL="en_US.UTF-8" # Tells tmux that UTF-8 is supported
export LANG="en_US.UTF-8" # Same as above

eval "$(oh-my-posh init zsh --config ~/.themes/oh-my-posh/themes/tokyonight_storm.omp.json)"

# Set directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it is not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit 
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

# keybindings to emacs mode
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={a-zA-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

alias grep='grep --color=auto'
# Eza aliases
alias ls='eza --color=auto --icons=always'
alias ll='eza -la --ignore-glob=.. --icons=always'   # show long listing of all except ".."
alias l='eza -la --ignore-glob=. --icons=always'   # show long listing but no hidden dotfiles except "."

# Shell Integration
eval "$(fzf --zsh)"
