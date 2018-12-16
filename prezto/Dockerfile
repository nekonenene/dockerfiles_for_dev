FROM ubuntu:18.04

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    git \
    zsh

SHELL ["zsh", "-c"]
RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" && \
  setopt EXTENDED_GLOB; \
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do; \
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; \
  done

RUN chsh -s $(which zsh)

CMD ["zsh"]
