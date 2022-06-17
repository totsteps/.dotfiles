# https://nix-community.github.io/home-manager/options.html#opt-programs.gh.settings

{
  enable = true;
  settings.aliases = {
    open = "browse";
    git_protocol = "ssh";
  };
}
