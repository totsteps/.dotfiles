# https://nix-community.github.io/home-manager/options.html#opt-programs.neovim.enable

{
  enable = true;
  extraConfig = ''
    syntax on
    colorscheme zenburn
    set number
    set tabstop=2
    set autoindent
    set cursorline
    set ruler
    set sidescrolloff=15
    set spell spelllang=en_us
    set nobackup
    set noswapfile
    set mouse=a
    set t_Co=256
    filetype indent on
  '';
}
