# attach tmux when loggin
if [[ -z "$TMUX" ]]; then
  tmux attach || tmux new-session
  exit;
fi

source ~/.env

eval "$(sheldon source)"
