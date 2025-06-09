# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local:$PATH
export PATH="/usr/local/bin:${PATH}"

# Paths for mysqlclient -- brew install mysql-client
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
export CPPFLAGS="-I/usr/local/opt/mysql-client/include"

export PKG_CONFIG_PATH="/usr/local/opt/mysql-client/lib/pkgconfig"

export PATH="/usr/local/sbin:$PATH"
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Perl local::lib
# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh

# ZSH syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zoxide
eval "$(zoxide init zsh)"

# ZSH autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

set -o vi

# ZSH completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
source "$ZSH/oh-my-zsh.sh"
# ZSH theme
ZSH_THEME="robbyrussell"

# Yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# BREW COMMANDS --------------------------------------------------------------
# To launch borders to active window
# brew services start borders

# Aliases
alias n="nvim"
alias x="exit"
alias cd="z"
alias zsh="nvim ~/.config/.zshrc"
alias zs="source ~/.zshrc"
alias dot="cd ~/.config/"
alias nupdate="brew upgrade neovim --fetch-HEAD"
alias prj="cd ~/Documents/GitHub/website-django"
alias act="source .venv/bin/activate"
alias rs="source .venv/bin/activate && python3 manage.py runserver"
alias mm="python3 manage.py makemigrations"
alias mp="python3 manage.py migrate"

# Obsidian
alias op="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Personal"
alias ow="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Work"
alias or='nvim $HOME/library/Mobile\ Documents/iCloud~md~obsidian/Documents/Personal/notes/inbox/*.md'

alias ls="eza"
alias l="eza -al --icons"
alias lt="eza -lTg --level=2 --icons"
alias ds="python3 manage.py shell_plus"
alias srj="cd ~/Documents/GitHub/frame3dd"
alias lat="cd '/Users/geza/OneDrive - Gonvarri/Documents/Latex/Structural/'"
alias sr="source .venv/bin/activate && streamlit run Home.py"
alias nr="npm run"
alias lg="lazygit"
alias uvo="uv tree --outdated"
alias uvp="uv pip list --outdated"
alias v="neovide"
alias zl="zellij"
alias skim='/Applications/Skim.app/Contents/MacOS/Skim'
