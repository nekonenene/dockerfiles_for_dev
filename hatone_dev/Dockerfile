FROM prezto_ruby:latest

ARG HOME_DIR="/root"
ARG RC_PATH="$HOME_DIR/.zshrc"

ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US:en"
ENV LC_ALL="en_US.UTF-8"

SHELL ["zsh", "-c"]

RUN mkdir $HOME_DIR/Programs

RUN \
  apt-get update && \
  apt-get install -y \
    curl \
    emacs \
    language-pack-en \
    npm \
    vim \
    wget

# Node.js / npm
RUN \
  npm install -g n && \
  n lts && \
  apt-get remove -y nodejs

# dotfiles
RUN \
  echo $'\n\
## alias\n\
alias ls="ls -a --color=auto"\n\
alias g="git"\n\
alias gad="git add ."' \
  >> $RC_PATH

COPY files/.gitconfig /root
COPY files/.zpreztorc /root

CMD ["zsh"]
