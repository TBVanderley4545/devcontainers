FROM archlinux:latest

# Define variables
ARG CONTAINER_USER=developer
ARG CONTAINER_USER_PASSWORD=pass

# Initial System Setup
RUN sed -i 's/^#Color/Color/' /etc/pacman.conf
RUN pacman-key --init
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
  base-devel \
  bat \
  curl \
  fastfetch \
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
  openssh \
  pyenv \
  python \
  ripgrep \
  sudo \
  tmux \
  unzip \
  wget \
  zip \
  zsh

# Yay setup
RUN useradd -m aur
RUN echo "aur ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER aur
WORKDIR /tmp
RUN git clone https://aur.archlinux.org/yay-bin.git
WORKDIR /tmp/yay-bin
RUN makepkg -si --noconfirm
USER root
RUN userdel -r aur
RUN sed -i 's/^aur ALL=(ALL) NOPASSWD: ALL//' /etc/sudoers

# User setup
RUN useradd -m -G wheel -s /bin/zsh $CONTAINER_USER
RUN echo "$CONTAINER_USER:$CONTAINER_USER_PASSWORD" | chpasswd
RUN sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Change to user and starting dir
USER $CONTAINER_USER
WORKDIR /home/$CONTAINER_USER
RUN mkdir src
