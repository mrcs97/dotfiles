export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="robbyrussell"
#ZSH_THEME="alanpeabody"
ZSH_THEME="eastwood"

plugins=(
    git
    zsh-autosuggestions
    you-should-use
    sudo
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
alias v="vim"
alias gc="git clone"
# ===== USR CONF =====

lg() {
  git add .
  git commit -m "$1"
  git push origin HEAD
}

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
export AUTH="$HOME/.ssh/.hosts"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# bun completions
[ -s "/home/rbx86/.bun/_bun" ] && source "/home/rbx86/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# golang (i added this)
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# pnpm
export PNPM_HOME="/home/rbx86/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
export PATH="$(brew --prefix john-jumbo)/share/john:$PATH"

export PATH="$(gem env gemdir)/bin:$PATH"
