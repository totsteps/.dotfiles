{
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

    # copy contents of a file
    "copy" = "pbcopy < ";
    # zip directories excluding .DS_Store
    "zip" = "gzip --recursive --best --keep";
    # get relative path, depends on coreutils
    "path" = "realpath";
    # Hide/show all desktop icons (useful when presenting)
    "hidedesk" = "defaults write com.apple.finder CreateDesktop -bool false && killall Finder";
    "showdesk" = "defaults write com.apple.finder CreateDesktop -bool true && killall Finder";

    # exa
    ls = "exa -1F --group-directories-first";
    l = "exa -lagH --group-directories-first --git";
    ll = "exa -l --group-directories-first --git";

    # neovim
    vi = "nvim";
    vim = "nvim";

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

    # pnpm
    y = "pnpm";
    yi = "pnpm install";
    ya = "pnpm add";
    yag = "pnpm add -g";
    ys = "pnpm start";
    yd = "pnpm dev";
    yb = "pnpm build";
    yt = "pnpm test";
    yl = "pnpm lint";
    yf = "pnpm format";

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

    # todo see what's the right way to export paths in nix
    # pnpm
    export PNPM_HOME="/Users/gagan/Library/pnpm"
    export PATH="$PNPM_HOME:$PATH"
  '';

  shellGlobalAliases = {
    uuid = "$(uuidgen | tr -d \\n)";
    G = "| grep";
    S = "| sort";
  };

  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;
}
