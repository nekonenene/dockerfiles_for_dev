FROM prezto:latest

ARG RUBY_VER="2.5.3"
ARG RC_PATH="/root/.zshrc"

SHELL ["zsh", "-c"]

# Ruby dependencies
RUN \
  apt-get update && \
  apt-get install -y \
    build-essential \
    libssl-dev \
    libreadline-dev \
    wget \
    zlib1g-dev

# rbenv
RUN \
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
  cd ~/.rbenv/ && \
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build && \
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $RC_PATH && \
  echo 'eval "$(rbenv init -)"' >> $RC_PATH

# Ruby
RUN \
  source $RC_PATH && \
  rbenv install $RUBY_VER && \
  rbenv rehash

# gems
RUN \
  source $RC_PATH && \
  rbenv global $RUBY_VER && \
  gem install \
    bundler \
    pry

CMD ["zsh"]
