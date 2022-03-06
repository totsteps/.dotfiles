# https://nix-community.github.io/home-manager/options.html#opt-programs.zellij.enable
# https://zellij.dev/documentation/options.html

{
  enable = true;
  settings = {
    default_mode = "normal";
    simplified_ui = true;
    pane_frames = false;
    # plugins:
    # - path: tab-bar
    #   tag: tab-bar
    # - path: status-bar
    #   tag: status-bar
    # - path: strider
    #   tag: strider
    # plugins = [
    #   "tab-bar" "status-bar"
    # { "tab-bar" = { path = "tab-bar" }};
    # { "status-bar" = { path = "status-bar" }};
    # ];
  };
}
