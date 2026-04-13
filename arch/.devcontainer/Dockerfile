FROM archlinux:latest

# Define variables
ARG USERNAME=developer
ARG USER_PASSWORD=pass

# Initial System Setup
RUN pacman-key --init
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
  base-devel \
  bat \
  curl \
  fzf \
  git \
  github-cli \
  go \
  jq \
  lazygit \
  less \
  lsd \
  man-pages \
  neovim \
  pyenv \
  python \
  ripgrep \
  sudo \
  tmux \
  unzip \
  wget \
  zip \
  zsh

# User setup
RUN useradd -m -G wheel -s /bin/zsh $USERNAME
RUN echo "$USERNAME:$USER_PASSWORD" | chpasswd
RUN sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Change to user and starting dir
USER $USERNAME
WORKDIR /home/$USERNAME
RUN mkdir src
