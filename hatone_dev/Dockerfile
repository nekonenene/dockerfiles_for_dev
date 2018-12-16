FROM prezto_ruby:latest

ARG HOME_DIR="/root"
ARG RC_PATH="$HOME_DIR/.zshrc"

SHELL ["zsh", "-c"]

RUN mkdir $HOME_DIR/Programs

RUN \
  apt-get update && \
  apt-get install -y \
    build-essential \
    curl \
    emacs \
    npm \
    vim \
    wget

# dotfiles
RUN \
  echo $'\n\
## alias\n\
alias ls="ls -a --color=auto"\n\
alias g="git"\n\
alias gad="git add ."' \
  >> $RC_PATH

COPY files/.gitconfig /root

# Node.js / npm
RUN \
  npm install -g n && \
  n lts && \
  apt-get remove -y nodejs

CMD ["zsh"]
