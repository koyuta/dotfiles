ulimit -n 4096

# path setting
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/opt/bin:/usr/bin:$PATH

# prompt setting
autoload -Uz colors && colors
PROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}%1(v| %F{red}%1v%f|) "
