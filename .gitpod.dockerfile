FROM docker.io/library/ubuntu:22.04

# Install:
# - git (and git-lfs), for git operations (to e.g. push your work).
#   Also required for setting up your configured dotfiles in the workspace.
# - sudo, while not required, is recommended to be installed, since the
#   workspace user (`gitpod`) is non-root and won't be able to install
#   and use `sudo` to install any other tools in a live workspace.
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -yq \
    git \
    git-lfs \
    sudo \
    texlive-full \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# Create the gitpod user. UID must be 33333.
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

USER gitpod
