{
  # todo: source zsh after creating a new generation, otherwise the
  # aliases dont work. Maybe execute the source command once new generation
  # has been created in this file, or at the very end of the home.nix file?
  enable = true;
  # not working
  shellAliases = {
    g = "git";
    gs = "g s";
    ".." = "cd ..";
    "..." = "cd ../..";
  };
  
  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;
}