{ config, pkgs, ... }:

{
  home.username = "gagan";
  home.homeDirectory = "/Users/gagan";

  home.file.".config/git/ignore".source = ./.gitignore;

  # silent nix news
  news.display = "silent";

  # abstract these into personal and work related files.
  home.packages = [
    pkgs.bat
    pkgs.delta
    pkgs.dive
    pkgs.exa
    pkgs.git-standup
    # split work related packages
    pkgs.go
    pkgs.less
    # pkgs.nodejs-16_x
    pkgs.nodejs-14_x
    pkgs.pueue
    pkgs.rustup
    # compile error when building starship
    # pkgs.starship
    pkgs.tokei
    pkgs.tree
    pkgs.tmux
    pkgs.yarn

    pkgs.nodePackages.serve
    pkgs.nodePackages.vercel

    # nix formatter - https://github.com/nix-community/nixpkgs-fmt
    pkgs.nixpkgs-fmt
  ];

  programs.git = import ./git/git.nix;
  programs.gh = import ./git/gh.nix;
  programs.zellij = import ./zellij/zellij.nix;
  programs.zsh = import ./zsh/zsh.nix;
  programs.neovim = import ./vim/vim.nix;
  programs.bat = { };
  programs.zoxide = {
    enable = true;
  };
  # ln -s "$(pwd)/home.nix" /Users/gagan/.config/nixpkg

  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
}
