{ config, pkgs, ... }:

{
  home.username = "mac";
  home.homeDirectory = "/Users/mac";

  news.display = "silent";
 
  home.packages = [
    pkgs.bat
    # delta has no prebuilt derivation for 'macOS', building it from source fails with a linker error!
    # pkgs.delta
    pkgs.dive
    pkgs.exa
    pkgs.exercism
    pkgs.fpp
    pkgs.gh
    pkgs.git
    pkgs.git-standup
    pkgs.heroku
    pkgs.hexyl
    pkgs.less
    pkgs.nodejs-16_x
    pkgs.nodePackages.pnpm
    pkgs.jdk
    pkgs.pueue
    pkgs.python3Full
    pkgs.rustup
    pkgs.starship
    pkgs.tokei
    pkgs.tree
    pkgs.yarn
    pkgs.zoxide
  ];

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
}
