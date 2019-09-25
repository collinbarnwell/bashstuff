alias gclang-format="git clang-format --style=file"

export EDITOR='emacs'
export VISUAL='emacs'

export PATH=$PATH:/home/collinbarnwell/bazel-buildtools/bazel-bin/buildifier/linux_amd64_stripped/buildifier

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

CODE_DIR="$HOME/c"
TAG_FILE="$CODE_DIR/TAGS"
INOTIFY_CMD="inotifywait --quiet --exclude=TAGS -r -e close_write,moved_to,create -m $CODE_DIR"

if pgrep --full "${INOTIFY_CMD}"  > /dev/null
then
true
else
$INOTIFY_CMD |
while read -r directory events filename; do
  find $CODE_DIR -name '*.c' -o -name '*.h' -exec etags --output=$TAG_FILE -a {} \;
done &
fi
