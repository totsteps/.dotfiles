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
    pkgs.coreutils
    pkgs.delta
    pkgs.dive
    pkgs.exa
    pkgs.exercism
    pkgs.flyctl
    pkgs.gh
    pkgs.git
    pkgs.git-standup
    # split work related packages
    # pkgs.go
    pkgs.less
    pkgs.nodejs-16_x
    pkgs.nushell
    pkgs.pueue
    pkgs.rustup
    # compile error when building starship
    pkgs.starship
    pkgs.tmux
    pkgs.tokei
    pkgs.tree
    pkgs.yarn

    pkgs.git-open
    # pkgs.nodePackages.prettier
    pkgs.nodePackages.nodemon
    pkgs.nodePackages.pnpm
    pkgs.nodePackages.serve
    pkgs.nodePackages.vercel
    pkgs.yt-dlp
    pkgs.zellij
    pkgs.zoxide

    # nix formatter - https://github.com/nix-community/nixpkgs-fmt
    pkgs.nixpkgs-fmt
  ];

  programs.bat = { };
  programs.gh = import ./git/gh.nix;
  programs.git = import ./git/git.nix;
  programs.neovim = import ./vim/vim.nix;
  programs.starship = {
    enable = true;
  };
  programs.zellij = import ./zellij/zellij.nix;
  programs.zoxide = {
    enable = true;
  };
  programs.zsh = import ./zsh/zsh.nix;

  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
}
