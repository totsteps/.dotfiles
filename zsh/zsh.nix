{
  # todo: source zsh after creating a new generation, otherwise the
  # aliases dont work. Maybe execute the source command once new generation
  # has been created in this file, or at the very end of the home.nix file?
  enable = true;
  shellAliases = {
    g = "git";
    gs = "g s";
    gss = "g status";
    ga = "g add";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "c" = "clear";
    "j" = "z";

    # exa
    ls = "exa -1F --group-directories-first";
    l = "exa -lagH --group-directories-first --git";
    ll = "exa -l --group-directories-first --git";

    # neovim
    vi = "nvim";

    # edit and source configs
    econf = "code ~/dev/.dotfiles";
    sconf = "exec zsh";

    # most used directories
    dev = "cd ~/dev";
    fork = "cd ~/dev/fork";
    scratch = "cd ~/dev/scratch";
    desk = "cd ~/Desktop";
    doc = "cd ~/Documents";
    img = "cd ~/Pictures";
    down = "cd ~/Downloads";

    # nix
    hm = "home-manager";
    # source .zshrc after creating new generation
    hms = "home-manager switch; sconf";
    hmg = "home-manager generations";
    hmp = "home-manager packages S";
    clean = "nix-collect-garbage -d";

    # yarn
    yi = "yarn install";
    ya = "yarn add";
    ys = "yarn start";
    yd = "yarn dev";
    yb = "yarn build";
    yt = "yarn test";
    yl = "yarn lint";
    yf = "yarn format";
    yfc = "yarn format:check";

    # ip address
    ip = "echo Your ip is 🛖; dig +short myip.opendns.com @resolver1.opendns.com;";
    # ping google.com
    pg = "echo 'Pinging Google 🚨'; ping google.com";
  };

  initExtra = ''
    mkcd() {
      mkdir -p $@; cd ''${@:$#}
    }

    # benchmarking zsh launch time
    # https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load.html#initial-setup
    zshtime() {
      shell=''${1-$SHELL}
      for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
    }
  '';

  shellGlobalAliases = {
    uuid = "$(uuidgen | tr -d \\n)";
    G = "| grep";
    S = "| sort";
  };

  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;
}
