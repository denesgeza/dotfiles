# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local:$PATH
export PATH="/usr/local/bin:${PATH}"

# Paths for mysqlclient -- brew install mysql-client
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
export CPPFLAGS="-I/usr/local/opt/mysql-client/include"

export PKG_CONFIG_PATH="/usr/local/opt/mysql-client/lib/pkgconfig"

export PATH="/usr/local/sbin:$PATH"

# # Perl local::lib
# # eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# -------- OH MY POSH CONFIGURATION ---------------------------------------------------
# Theme
# eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/themes/cert-light.omp.json)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/themes/cert-dark.omp.json)"
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/themes/custom.toml)"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi

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

# Load different nvims
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"

function nvims() {
  items=("LazyVim" "kickstart" "gvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Configs " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "LazyVim" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"

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
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias n="nvim"
alias k="NVIM_APPNAME=kickstart nvim"
alias g="NVIM_APPNAME=gvim nvim"
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
