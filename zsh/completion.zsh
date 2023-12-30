# Do not distinguish between uppercase and lowercase letters when completing candidates,
# but distinguish uppercase letters when inputting
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Do not complete the parent directory
zstyle ':completion:*' ignore-parents parent pwd ..

# Do not complete the parent directory when changing directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd
