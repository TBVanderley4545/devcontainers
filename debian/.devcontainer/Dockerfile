FROM debian:latest

# Define variables
ARG USERNAME=developer
ARG USER_PASSWORD=pass

# Initial System Setup
RUN apt update
RUN apt upgrade -y
RUN apt install -y \
  bat \
  curl \
  fzf \
  git \
  gh \
  golang-go \
  jq \
  lazygit \
  less \
  locales \
  lsd \
  pyenv \
  python3 \
  python3-venv \
  ripgrep \
  sudo \
  tmux \
  unzip \
  wget \
  zip \
  zsh

# Setup UTF-8 locale
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG=en_US.utf8

# Build Neovim for user
RUN apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen -y

WORKDIR /tmp
RUN git clone https://github.com/neovim/neovim

WORKDIR /tmp/neovim
RUN git checkout stable
RUN make CMAKE_BUILD_TYPE=Release
RUN make install

# User setup
RUN useradd -m -G sudo -s /bin/zsh $USERNAME
RUN echo "$USERNAME:$USER_PASSWORD" | chpasswd

# Change to user and starting dir
USER $USERNAME
WORKDIR /home/$USERNAME
RUN mkdir src
