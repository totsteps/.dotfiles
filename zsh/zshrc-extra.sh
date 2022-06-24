# benchmark zsh launch time
# https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load.html#initial-setup
zshtime() {
  shell=''${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# create a directory and cd into it
mkcd() {
  mkdir -p $@ && cd ${@:$#}
}

# copy contents of a file
alias copy="pbcopy < "
alias diff="diff --color=auto --width='$(($(tput cols) - 2))'"

# zoxide
alias j="z"

# get relative path, requires coreutils
alias path="realpath"

# zip directories excluding
alias zip="gzip --recursive --best --keep"

# ip address
alias ip="echo 'Your ip is 🛖'; dig +short myip.opendns.com @resolver1.opendns.com;"
# ping google.com
alias pg="echo 'Pinging Google 🚨'; ping google.com"

# Hide/show all desktop icons (useful when presenting)
alias hidedesk="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesk="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# edit and source config
alias econf="code ~/dev/.dotfiles"
alias ehis="code ~/.zsh_history"
alias sconf="exec zsh"

# nix
alias hm="home-manager"
# source .zshrc after creating new generation
alias hms="home-manager switch; sconf; hmd"
alias hmd="nix doctor"
alias hmg="home-manager generations"
alias hmp="home-manager packages S"
alias clean="nix-collect-garbage -d"

setopt autocd
alias ..="cd .."
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias ......="../../../../.."

# most used directories
alias desk="cd ~/Desktop"
alias dev="cd ~/code/dev"
alias fork="cd ~/code/fork"
alias scratch="cd ~/code/scratch"
alias uni="cd ~/code/uni"
alias doc="cd ~/Documents"
alias img="cd ~/Pictures"
alias down="cd ~/Downloads"
alias metal="cd ~/code/metal"

# exa
alias ls="exa -1F --group-directories-first"
alias l="exa -lagH --group-directories-first --git"
alias ll="exa -l --group-directories-first --git"
alias c="clear"

# save me from myself
alias rm="trash -v"

# neovim
alias vi="vim"
alias vim="nvim"

# git
alias g="git"
alias gs="g s"
alias gss="g ss"
alias gl="g l"
alias gla="g la"
alias glg="g lg"
alias gb="g b"
alias gbs="g bs"
alias gbd="g b -D" # delete a branch
alias gbc="gco -b" # create and checkout new branc
alias gp="g pull"
alias gpsr="git submodule update --init --recursive"
alias go="g open"
alias gcl="g clone"
alias gclr="g clone --recurse-submodules"
alias gc="g commit"
alias gco="g checkout"
alias ga="g add"
alias gd="g d"
alias gds="g d --staged"
alias gfo="g fetch origin"
alias gfu="g fetch upstream"

# pnpm
alias y="pnpm"
alias yi="pnpm i"
alias ya="pnpm add"
alias yag="pnpm add -g"
alias yr="pnpm rm"
alias yrg="pnpm rm -g"
alias ys="pnpm start"
alias yd="pnpm dev"
alias yb="pnpm build"
alias yt="pnpm test"
alias yl="pnpm lint"
alias yf="pnpm format"
