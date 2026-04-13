FROM debian:latest

# Define variables
ARG USERNAME=developer
ARG USER_PASSWORD=pass

# Initial System Setup
RUN apt update
RUN apt upgrade
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
  lsd \
  pyenv \
  python3 \
  ripgrep \
  sudo \
  tmux \
  unzip \
  wget \
  zip \
  zsh

# User setup
RUN useradd -m -G sudo -s /bin/zsh $USERNAME
RUN echo "$USERNAME:$USER_PASSWORD" | chpasswd

# Change to user and starting dir
USER $USERNAME
WORKDIR /home/$USERNAME
RUN mkdir src

# Build Neovim for user
RUN sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
RUN cd /tmp
RUN git clone https://github.com/neovim/neovim
RUN cd neovim
RUN git checkout stable
RUN make CMAKE_BUILD_TYPE=Release
RUN sudo make install
