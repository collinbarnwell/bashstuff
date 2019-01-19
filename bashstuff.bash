alias gclang-format="git clang-format --style=file"

export EDITOR='emacs'
export VISUAL='emacs'

export PATH=$PATH:/home/collinbarnwell/bazel-buildtools/bazel-bin/buildifier/linux_amd64_stripped/buildifier

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
