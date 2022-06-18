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
    # List aliases
    # aliases = config --get-regexp alias
    aliases = "config --get-regexp '^alias\\.'";

    # git status
    s = "status -sb";
    ss = "status";

    # l = all commits, only current branch
    l = "!. ~/.config/git/githelpers.sh && pretty_git_log";
    lg = "log --color --graph --pretty=format:'%C(always,yellow)%h%C(always,reset) -%C(always,green)(%ar)%C(always,reset) %C(always,blue)<%an>%C(always,reset) %C(always,red)%d%C(always,reset) %s' --abbrev-commit --branches";
    #pretty=format:%C(auto,yellow)%h%C(auto,magenta)% G? %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(7,trunc)%aN%C(auto,reset)%s%C(auto,red)% gD% D
    #git log --graph --all --pretty=format:'%C(yellow)%h -%C(auto)%d %C(bold cyan)%s %C(bold white)(%cr)%Creset %C(dim white)<%an>'

    # la = all commits, all reachable refs
    la = "l --all";

    # h = head
    head = "!git r -1";
    h = "!git head";

    # hp = head with patch
    hp = "!. ~/.config/git/githelpers.sh && show_git_head";

    # r = recent commits, only current branch
    r = "!GIT_NO_PAGER=1 git l -20";

    # ra = recent commits, all reachable refs
    ra = "r --all";

    # b = all branches
    b = "!. ~/.config/git/githelpers.sh && pretty_git_branch";

    # bs = all branches, sorted by last commit date
    bs = "!. ~/.config/git/githelpers.sh && pretty_git_branch_sorted";

    # d = show git diff with pager
    d = "!. ~/.config/git/githelpers.sh && show_git_diff";

    # stat = shows insertions and deletions from staged files
    stat = "!. ~/.config/git/githelpers.sh && show_git_stat";

    stashls = "!. ~/.config/git/githelpers.sh && show_git_stash";

    # tags = "tag -l $* | !. ~/.config/git/githelpers.sh && git_page_maybe"

    # Show the user email for the current repository.
    whoami = "config user.email";

    # List contributors with number of commits.
    contributors = "shortlog --summary --numbered";
  };
  extraConfig = {
    init = {
      defaultBranch = "main";
    };
    core = {
      editor = "vim";
      pager = "less -LRc --mouse";
    };
    color = {
      ui = true;
    };
    push = {
      default = "current";
    };
    pull = {
      default = "current";
      ff = "only";
    };
    pager = {
      # https://github.com/dandavison/delta/issues/630#issuecomment-860046929
      diff = "LESS='LRc --mouse' delta";
      show = "LESS='LRc --mouse' delta";
      log = "LESS='LRc --mouse' delta";
      blame = "LESS='LRc --mouse' delta";
      grep = "LESS='LRc --mouse' delta";
      reflog = "LESS='LRc --mouse' delta";
    };
    interactive = {
      diffFilter = "LESS='LRc --mouse' delta --color-only";
    };
    delta = {
      navigate = true;
      side-by-side = true;
      line-numbers = true;
    };
  };
}
