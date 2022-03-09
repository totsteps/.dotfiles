# https://nix-community.github.io/home-manager/options.html#opt-programs.git.enable

{
  enable = true;
  userName = "Gagandeep Singh";
  userEmail = "totsteps.gs@gmail.com";
  signing = {
    key = null;
    signByDefault = true;
  };
  aliases = {
    s = "status";
    co = "checkout";
    b = "branch";
  };
  extraConfig = {
    core = {
      editor = "vim";
    };
    color = {
      ui = true;
    };
    init = {
      defaultBranch = "main";
    };
  };
}
