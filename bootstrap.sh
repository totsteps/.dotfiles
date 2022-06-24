#!/usr/bin/env bash

# create ~/just
mkdir -p ~/just

# download and extract just to ~/just/just
curl --proto "=https" --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/just

# add `~/just` to the paths
export PATH="$PATH:$HOME/just"

# NIX_PATH for home-manager
export NIX_PATH="$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}"

# just
just nix

# resource shell
echo "Resourcing shell"
exec $SHELL
