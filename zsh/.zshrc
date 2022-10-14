source ~/dotfiles/zsh-snap/znap.zsh
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export GPG_TTY=$(tty)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH=$HOME/omnetpp-6.0rc1/bin:$HOME/omnetpp-6.0rc1/tools/macosx/bin:$PATH
export QT_PLUGIN_PATH=$HOME/omnetpp-6.0rc1/tools/macosx/plugins
export PATH="/usr/local/opt/node@14/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias python='python3'
alias pip='pip3'

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

znap source marlonrichert/zsh-autocomplete
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}"
    unset timer
  fi
}

