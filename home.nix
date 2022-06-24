{ config, pkgs, ... }:

{
  home.username = "gagan";
  home.homeDirectory = "/Users/gagan";

  home.file.".config/git/ignore".source = ./.gitignore;
  home.file.".config/git/githelpers.sh".source = ./git/githelpers.sh;
  # vim colors
  home.file.".config/nvim/colors".source = ./vim/colors;
  #  IntelliJ IDEA vim plugin config
  home.file.".ideavimrc".source = ./.ideavimrc;
  # cargo aliases doesn't seem to work
  home.file.".cargo/config".source = ./cargo/config;

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
    pkgs.just
    pkgs.less
    pkgs.nodejs-16_x
    pkgs.nushell
    pkgs.pueue
    pkgs.rustup
    pkgs.starship
    pkgs.tmux
    pkgs.tokei
    pkgs.tree
    pkgs.yarn
    pkgs.git-open
    pkgs.nodePackages.prettier
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

  programs.bat = {
    enable = true;
    config = {
      theme = "OneHalfDark";
      style = "numbers,changes,header,grid";
      italic-text = "always";
      pager = "less -FR";
      map-syntax = [ "h:cpp" ".ignore:.gitignore" ];
    };
  };
  programs.gh = import ./git/gh.nix;
  programs.git = import ./git/git.nix;
  programs.neovim = import ./vim/vim.nix;
  programs.starship = import ./starship/starship.nix;
  programs.zellij = import ./zellij/zellij.nix;
  programs.zoxide = {
    enable = true;
  };
  programs.zsh = import ./zsh/zsh.nix;

  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
}
