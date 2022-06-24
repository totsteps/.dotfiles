set export

OS := os()
HOME_DIR := env_var("HOME")
NIX_MANAGER_CONFIG_PATH := join(HOME_DIR, ".config/nixpkgs")

NIX_SHELL_URL := if (OS) == "macos" {
  "<(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon"
} else if (OS) == "linux" {
  "<(curl -L https://nixos.org/nix/install) --daemon"
} else {
  ""
}

# install nix shell
nix:
  #!/usr/bin/env bash
  set -euxo pipefail

  echo "Running on: {{OS}}"

  # https://nix.dev/tutorials/install-nix#macos
  # https://gist.github.com/angerman/cbe02d814d81a8e4d4ced56b19046c19
  # Install nix shell
  sh {{NIX_SHELL_URL}}

# install home-manager
home-manager:
  # Add Nixpkgs channels
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update

  echo hello ${NIX_PATH}
  nix-shell '<home-manager>' -A install

  # remove old home-manager config if exists
  if [ -d {{NIX_MANAGER_CONFIG_PATH}} ]; then rm -Rf {{NIX_MANAGER_CONFIG_PATH}}; fi

  # create nixpkgs directory
  echo {{NIX_MANAGER_CONFIG_PATH}}
  mkdir -p {{NIX_MANAGER_CONFIG_PATH}}

  # symlink new config
  ln -sf "$(pwd)/home.nix" {{NIX_MANAGER_CONFIG_PATH}}

  # Switch profile
  home-manager switch

  # garbage collection
  nix-collect-garbage -d

  # run 'rust' recipe
  just rust

  # remove ~/just
  echo "Removing {{join(HOME_DIR, "just")}}"
  rm -rf {{join(HOME_DIR, "just")}}

# install rust and cargo plugins
rust:
  rustup install stable
  rustup install nightly
  cargo install cargo-bloat
  cargo install cargo-cache
  cargo install cargo-expand
  cargo install flamegraph
  cargo install cargo-instruments
  cargo install cargo-llvm-lines
  cargo install cargo-nextest
  cargo install cargo-watch
  cargo install cargo-wipe

lint:
  #!/usr/bin/env bash
  set -euxo pipefail

  echo "OS is: {{OS}}"