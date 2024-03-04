ulimit -n 4096

# prompt setting
autoload -Uz colors && colors
PROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}%1(v| %F{red}%1v%f|) "

# path setting
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/opt/bin:/usr/bin:$PATH

# homebrew for apple silicon
if [[ `uname -p` == "arm" ]]; then
  HOMEBREW_ROOT=/opt/homebrew
  export PATH=$HOMEBREW_ROOT/bin:$PATH
fi

# attach tmux when loggin
if [[ -z "$TMUX" ]]; then
  tmux attach || tmux new-session
  exit;
fi

source ~/.env

eval "$(sheldon source)"
