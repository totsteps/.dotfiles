#!/usr/bin/env bash

# download and make 'just' available as a shell command
mkdir -p ~/just
curl --proto "=https" --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/just
export PATH="$PATH:$HOME/just"

# NIX_PATH for home-manager; 'just' seems to have issues with exporting path variables
export NIX_PATH="$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}"

just nix

# resource shell
echo "Resourcing shell"
exec $SHELL
