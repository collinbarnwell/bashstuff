alias gclang-format="git clang-format --style=file"

e() { emacsclient -c "$@" & }
export EDITOR='emacs -nw'
export VISUAL='emacs'

export PATH=$PATH:$HOME/.local/bin

alias k="kubectl"

export ctop=collinbarnwell@beech.c.googlers.com

alias gsu="git submodule update --init --recursive"

export PATH=$PATH:$HOME/go/bin

DISABLE_UPDATE_PROMPT=true
