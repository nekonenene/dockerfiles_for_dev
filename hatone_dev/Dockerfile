FROM prezto_ruby:latest

ARG RC_PATH="/root/.zshrc"

SHELL ["zsh", "-c"]

RUN \
  apt-get update && \
  apt-get install -y \
    build-essential \
    curl \
    emacs \
    npm \
    vim \
    wget

## dotfiles
# alias
RUN \
  echo $'\n\
alias ls="ls -a --color=auto"\n\
alias g="git"\n' \
  >> $RC_PATH

# Node.js / npm
RUN \
  npm install -g n && \
  n lts && \
  apt-get remove -y nodejs

CMD ["zsh"]
