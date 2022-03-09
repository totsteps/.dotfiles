# https://nix-community.github.io/home-manager/options.html#opt-programs.gh.settings

{
  enable = true;
  settings.aliases = {
    open = "browse";
  };
}

# What protocol to use when performing git operations. Supported values: ssh, https
#git_protocol: ssh
# What editor gh should run when creating issues, pull requests, etc. If blank, will refer to environment.
#editor:
# When to interactively prompt. This is a global config that cannot be overridden by hostname. Supported values: enabled, disabled
#prompt: enabled
# A pager program to send command output to, e.g. "less". Set the value to "cat" to disable the pager.

