{
  enable = true;
  initExtra = builtins.readFile ./zshrc-extra.sh;
  envExtra = builtins.readFile ./zshenv-extra.sh;

  shellGlobalAliases = {
    uuid = "$(uuidgen | tr -d \\n)";
    G = "| grep";
    S = "| sort";
  };

  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;
}
