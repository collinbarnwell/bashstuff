alias gclang-format="git clang-format --style=file"

export EDITOR='emacs'
export VISUAL='emacs'

export PATH=$PATH:/home/collinbarnwell/.local/bin

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "


# for dir in $HOME/c/*/     # list directories in the form "/fullpath/dirname/"
# do

CODE_DIR=${dir%*/}      # remove the trailing "/"
TAG_FILE="$CODE_DIR/TAGS"

alias makectags='ctags -R common/ project/'

alias makenote='export FILE=~/notes/note-$(date "+%F").txt ; touch "$FILE" ; emacs "$FILE" & '

# INOTIFY_CMD="inotifywait --quiet --exclude=TAGS -r -e close_write,moved_to,create -m $CODE_DIR"

# Update  TAGS file now.
# find $CODE_DIR -regex '.*\.cc$' -o -regex '.*\.c$' -o -regex '.*\.h$' -exec etags --output=$TAG_FILE {} \; &

# if pgrep --full "${INOTIFY_CMD}"  > /dev/null  # If inotify proc is not running, start it so that TAGS file updates.
# then
# true
# else
# $INOTIFY_CMD |
# while read -r directory events filename; do
  # find $CODE_DIR -regex '.*\.cc$' -o -regex '.*\.c$' -o -regex '.*\.h$' -exec etags --output=$TAG_FILE {} \;
# done &
# fi

# done
